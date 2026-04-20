page 50001 CursedWeaponCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = CursedWeapon;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    // -> Al crear nuevo, se asigna automáticamente desde la serie CW
                }

                field(Description; Rec.Description)
                {
                    Caption = 'Descripción';
                    ApplicationArea = All;
                    // -> Descripción
                }

                field(CursedGrade; Rec.CursedGrade)
                {
                    Caption = 'Grado de maldición';
                    ApplicationArea = All;
                    // -> Grado de la maldición
                }

                field(WeaponStatus; Rec.WeaponStatus)
                {
                    Caption = 'Estado del arma';
                    ApplicationArea = All;
                    // -> Solo vía acción Cambiar Estado
                }

                field(InnateTeq; Rec.InnateTeq)
                {
                    Caption = 'Técnica innata';
                    ApplicationArea = All;
                    // -> Desplegable con los valores del enum
                }

                field(ForgerName; Rec.ForgerName)
                {
                    Caption = 'Nombre del forjador';
                    ApplicationArea = All;
                    // -> Nombre del forjador
                }

                field(BindingVows; Rec.BindingVows)
                {
                    Caption = 'Votos vinculantes';
                    ApplicationArea = All;
                    // -> Campo multilínea — MultiLine = true
                }

                field(ThreatLevel; Rec.ThreatLevel)
                {
                    Caption = 'Nivel de amenaza';
                    ApplicationArea = All;
                    // -> Calculado — se recalcula con la acción Calcular Amenaza
                }

                field(ForgerDate; Rec.ForgeDate)
                {
                    Caption = 'Fecha de forja';
                    ApplicationArea = All;
                    // -> fecha de forja
                }

                field(SoldToCustomerNo; Rec.SoldToCustomerNo)
                {
                    Caption = 'Número de clente comprador ';
                    ApplicationArea = All;
                    // -> Se rellena automáticamente al contabilizar el albarán
                }

                field(Notes; Rec.Notes)
                {
                    Caption = 'Notas';
                    ApplicationArea = All;
                    // -> Campo multilínea
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}