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
                field(IdCursedWeapon; Rec.No)
                {
                    ApplicationArea = All;
                }
                field(ItemNo; Rec.ItemNo)
                {
                    ApplicationArea = All;
                }
                field(CursedGrade; Rec.CursedGrade)
                {
                    ApplicationArea = All;
                }

                field(WeaponStatus; Rec.WeaponStatus)
                {
                    ApplicationArea = All;
                }

                field(InnateTeq; Rec.InnateTeq)
                {
                    ApplicationArea = All;
                }
                field(ThreatLevel; Rec.ThreatLevel)
                {
                    ApplicationArea = All;
                }
                field(ForgerName; Rec.ForgerName)
                {
                    ApplicationArea = All;
                }

                field(BindingVows; Rec.BindingVows)
                {
                    ApplicationArea = All;
                }

                field(ForgerDate; Rec.ForgeDate)
                {
                    ApplicationArea = All;
                }

                field(SoldToCustomerNo; Rec.SoldToCustomerNo)
                {
                    ApplicationArea = All;
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