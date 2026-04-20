page 50005 CursedWeaponAPI
{
    //PageType = API;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CursedWeapon;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                // field(Name; NameSource)
                // {

                // }
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