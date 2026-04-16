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

                // -> historial de cambios — solo lectura, sin editar ni borrar.
                // field(FieldSource; Rec.FieldSource)
                // {
                //     ApplicationArea = All;
                // }

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