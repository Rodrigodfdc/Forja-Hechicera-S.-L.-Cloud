page 50002 "Weapon Lifecycle List"
{
    PageType = List;
    SourceTable = "Weapon Lifecycle Entry";
    Caption = 'Ciclo de vida del arma';
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(LifecycleEntries)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Caption = 'Número de entrada';
                    ApplicationArea = All;
                }
                field("Weapon No."; Rec."Weapon No.")
                {
                    Caption = 'Número del arma';
                    ApplicationArea = All;
                }
                field(EntryDate; Rec.EntryDate)
                {
                    Caption = 'Fecha de entrada';
                    ApplicationArea = All;
                }
                field(OldStatus; Rec.OldStatus)
                {
                    Caption = 'Estado antiguo';
                    ApplicationArea = All;
                }
                field(NewStatus; Rec.NewStatus)
                {
                    Caption = 'Nuevo estado';
                    ApplicationArea = All;
                }
                field(Reason; Rec.Reason)
                {
                    Caption = 'Razón';
                    ApplicationArea = All;
                }
                field(UserID; Rec.UserID)
                {
                    ApplicationArea = All;
                }
                field(ThreatLevelAtEntry; Rec.ThreatLevelAtEntry)
                {
                    Caption = 'Nivel de amenaza al momento de la entrada';
                    ApplicationArea = All;
                }
            }
        }
    }
}
