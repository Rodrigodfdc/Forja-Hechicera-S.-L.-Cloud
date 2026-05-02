page 50004 "Cursed Techniques Card"
{
    PageType = Card;
    SourceTable = "Cursed Technique";
    Caption = 'Cursed Technique Card';
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
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
            group(DescGroup)
            {
                Caption = 'Description';
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    MultiLine = true;
                }
            }
        }
    }
}
