page 50004 CursedTechniquesCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CursedTechnique;

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