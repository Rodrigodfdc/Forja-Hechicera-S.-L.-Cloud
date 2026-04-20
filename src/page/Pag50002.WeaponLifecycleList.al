page 50002 WeaponLifecycleList
{
    // Historial cronologico de cambios de estado. 
    // Solo lectura — sin InsertAllowed, ModifyAllowed ni DeleteAllowed. 
    // Se usa como subpagina FactBox en la CursedWeaponCard y tambien es accesible directamente desde la busqueda de BC.

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = WeaponLifecycleEntry;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(EntryNo; Rec.EntryNo)
                {
                    Caption = 'Número de entrada';
                    ApplicationArea = All;
                }

                field(WeaponNo; Rec.WeaponNo)
                {
                    Caption = 'Número de arma';
                    ApplicationArea = All;
                }

                field(EntryDate; Rec.EntryDate)
                {
                    Caption = 'Fecha y hora del cambio';
                    ApplicationArea = All;
                }

                field(OldStatus; Rec.OldStatus)
                {
                    Caption = 'Estado anterior';
                    ApplicationArea = All;
                }

                field(NewStatus; Rec.NewStatus)
                {
                    Caption = 'Nuevo Estado';
                    ApplicationArea = All;
                }

                field(Reason; Rec.Reason)
                {
                    Caption = 'Motivo de cambio';
                    ApplicationArea = All;
                }

                field(UserID; Rec.UserID)
                {
                    Caption = 'Usuario que relizó el cambio';
                    ApplicationArea = All;
                }

                field(ThreatLevelAtEntry; Rec.ThreatLevelAtEntry)
                {
                    Caption = 'Nivel de amenaza en el momento del cambio';
                    ApplicationArea = All;
                }

            }

        }

        area(Factboxes)
        {

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
}