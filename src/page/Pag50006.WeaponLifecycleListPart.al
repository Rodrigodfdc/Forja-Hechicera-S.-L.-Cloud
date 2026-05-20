page 50006 "Weapon Lifecycle List Part"
{
    PageType = ListPart;
    SourceTable = "Weapon Lifecycle Entry";
    Caption = 'Ciclo de vida del arma';
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Entries)
            {
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
                    Caption = 'Motivo';
                    ApplicationArea = All;
                }
                field(UserID; Rec.UserID)
                {
                    Caption = 'Usuario';
                    ApplicationArea = All;
                }
            }
        }
    }
}
