page 50006 "Weapon Lifecycle List Part"
{
    PageType = ListPart;
    SourceTable = "Weapon Lifecycle Entry";
    Caption = 'Lifecycle History';
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
                    ApplicationArea = All;
                }
                field(OldStatus; Rec.OldStatus)
                {
                    ApplicationArea = All;
                }
                field(NewStatus; Rec.NewStatus)
                {
                    ApplicationArea = All;
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                }
                field(UserID; Rec.UserID)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
