page 50004 CursedWeaponAPI
{

    //-> Página donde va a ser la API
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CursedWeapon;

    layout
    {
        area(Content)
        {
            // repeater(GroupName)  -> Página para hacer un API
            // {
            //     field(Name; NameSource)
            //     {

            //     }
            // }
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