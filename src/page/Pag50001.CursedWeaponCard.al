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
                Caption = 'Calcular nivel de amenaza';
                ApplicationArea = All;
                Image = Calculate;
                trigger OnAction()
                var
                    Mgt: Codeunit "Cursed Weapon Mgt";
                begin
                    Mgt.CalculateThreatLevel(Rec."No.");
                    Rec.Get(Rec."No.");
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
