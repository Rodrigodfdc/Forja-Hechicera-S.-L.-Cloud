page 50000 CursedWeaponList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CursedWeapon;
    CardPageId = CursedWeaponCard;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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

                field(ForgerDate; Rec.ForgerDate)
                {
                    ApplicationArea = All;
                }

                field(SoldToCustomerNo; Rec.SoldToCustomerNo)
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