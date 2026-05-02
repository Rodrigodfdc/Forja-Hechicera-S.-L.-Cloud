page 50003 "Cursed Techniques List"
{
    PageType = List;
    SourceTable = "Cursed Technique";
    Caption = 'Cursed Techniques';
    CardPageId = "Cursed Techniques Card";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(TechniqueList)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(EnergyMultiplier; Rec.EnergyMultiplier)
                {
                    ApplicationArea = All;
                }
                field(MinGrade; Rec.MinGrade)
                {
                    ApplicationArea = All;
                }
                field(IsActive; Rec.IsActive)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
