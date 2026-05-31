page 50001 "Cursed Weapon Card"
{
    PageType = Card;
    SourceTable = "Cursed Weapon";
    Caption = 'Arma maldita';
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    caption = 'Número';
                    ApplicationArea = All;
                    ToolTip = 'Weapon identifier.';
                }
                field(Description; Rec.Description)
                {
                    caption = 'Descripción';
                    ApplicationArea = All;
                }
                field(CursedGrade; Rec.CursedGrade)
                {
                    caption = 'Grado maldito';
                    ApplicationArea = All;
                }
                field(WeaponStatus; Rec.WeaponStatus)
                {
                    caption = 'Estado del arma';
                    ApplicationArea = All;
                    StyleExpr = StatusStyle;
                }
                field(InnateTeq; Rec.InnateTeq)
                {
                    caption = 'Técnica innata';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Mgt: Codeunit "Cursed Weapon Mgt";
                    begin
                        Mgt.CalculateThreatLevel(Rec);
                        CurrPage.Update(true);
                    end;
                }
                field(ThreatLevel; Rec.ThreatLevel)
                {
                    caption = 'Nivel de amenaza';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(ForgeDetails)
            {
                Caption = 'Forge Details';
                field(ForgerName; Rec.ForgerName)
                {
                    caption = 'Nombre del forjador';
                    ApplicationArea = All;
                }
                field(ForgeDate; Rec.ForgeDate)
                {
                    caption = 'Fecha de forja';
                    ApplicationArea = All;
                }
                field(BindingVows; Rec.BindingVows)
                {
                    caption = 'votos vinculantes';
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
            group(SaleInfo)
            {
                Caption = 'Sale Information';
                field(SoldToCustomerNo; Rec.SoldToCustomerNo)
                {
                    caption = 'Vendida al cliente';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(Notes)
            {
                Caption = 'Notes';
                field(NotesField; Rec.Notes)
                {
                    caption = 'Notas';
                    ApplicationArea = All;
                    ShowCaption = false;
                    MultiLine = true;
                }
            }
        }
        area(FactBoxes)
        {
            part(LifecyclePart; "Weapon Lifecycle List Part")
            {
                ApplicationArea = All;
                Caption = 'ciclo de vida del arma ';
                SubPageLink = "Weapon No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CalculateThreat)
            {
                Caption = 'Calculate Threat Level';
                ApplicationArea = All;
                Image = Calculate;

                trigger OnAction()
                var
                    Mgt: Codeunit "Cursed Weapon Mgt";
                begin
                    // 1. Ejecuta el cálculo pasando el registro actual
                    Mgt.CalculateThreatLevel(Rec);

                    // 🟢 CORRECCIÓN A: Volvemos a leer el registro actualizado de la BD
                    Rec.Get(Rec."No.");

                    // 🟢 CORRECCIÓN B: Forzamos a la pantalla a redibujarse en vivo
                    CurrPage.Update(false);
                end;
            }
            action(ChangeStatus)
            {
                Caption = 'Cambiar estado';
                ApplicationArea = All;
                Image = ChangeStatus;
                trigger OnAction()
                var
                    Mgt: Codeunit "Cursed Weapon Mgt";
                    NewStatus: Enum "Weapon Status";
                    Reason: Text[150];
                begin
                    // Aqui puedes abrir un dialogo o pedir al usuario el nuevo estado
                    // Simplificado: cambia a Active como ejemplo
                    Reason := 'Manual status change';
                    Mgt.ChangeWeaponStatus(Rec."No.", NewStatus, Reason);
                    Rec.Get(Rec."No.");
                    CurrPage.Update(false);
                end;
            }

            // 🌟 NUEVO BOTÓN: Añádelo justo aquí para la simulación del tribunal
            action(MarcarDestruido)
            {
                Caption = 'Marcar como Destruido';
                ToolTip = 'Registra la destrucción del activo en combate e impacta el Ledger de seguridad.';
                ApplicationArea = All;
                Image = Delete;    // Icono visual de Business Central para roturas/bajas
                Promoted = true;      // Lo destaca en grande en la interfaz
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    Mgt: Codeunit "Cursed Weapon Mgt";
                begin
                    // 1. Validación previa de seguridad
                    if Rec.WeaponStatus = Rec.WeaponStatus::Destroyed then
                        Error('Este activo ya consta como destruido en el sistema.');

                    if Rec.WeaponStatus = Rec.WeaponStatus::Sold then
                        Error('No se puede destruir un activo que ya ha sido facturado y vendido.');

                    // 2. Cuadro de diálogo interactivo para el directo
                    if Confirm('¿Confirma la destrucción total del activo %1 en el campo de batalla?', false, Rec.Description) then begin

                        // 3. Invocamos tu codeunit de negocio para mutar el estado y escribir en el Ledger
                        Mgt.ChangeWeaponStatus(Rec."No.", Rec.WeaponStatus::Destroyed, 'Confirmado por la Organización de Hechiceros en combate');

                        // 4. Refrescamos la pantalla para que el tribunal vea el cambio en vivo
                        Rec.Get(Rec."No.");
                        CurrPage.Update(false);

                        Message('El activo ha sido dado de baja. Histórico inmutable actualizado.');
                    end;
                end;
            }

        }
    }

    var
        StatusStyle: Text;

    trigger OnAfterGetRecord()
    begin
        case Rec.WeaponStatus of
            Rec.WeaponStatus::Active:
                StatusStyle := 'Favorable';
            Rec.WeaponStatus::Sold:
                StatusStyle := 'Strong';
            Rec.WeaponStatus::Sealed:
                StatusStyle := 'Attention';
            Rec.WeaponStatus::Destroyed:
                StatusStyle := 'Unfavorable';
            else
                StatusStyle := 'StandardAccent';
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        NoSeriesMgt: Codeunit "NoSeriesManagement";
    begin
        if Rec."No." = '' then
            NoSeriesMgt.InitSeries('CW', '', Today, Rec."No.", Rec."No. Series");
        Rec.WeaponStatus := Rec.WeaponStatus::Dormant;
    end;
}
