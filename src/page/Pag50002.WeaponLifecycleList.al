page 50002 WeaponLifecycleList
{
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
                    ApplicationArea = All;
                }

                field(WeaponNo; Rec.WeaponNo)
                {
                    ApplicationArea = All;
                }

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

                field(ThreatLevelAtEntry; Rec.ThreatLevelAtEntry)
                {
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