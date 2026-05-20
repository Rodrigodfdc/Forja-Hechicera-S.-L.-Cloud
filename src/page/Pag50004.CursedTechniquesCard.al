page 50004 "Cursed Techniques Card"
{
    PageType = Card;
    SourceTable = "Cursed Technique";
    Caption = 'Técnica maldita';
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
                    Caption = 'Código';
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    Caption = 'Nombre';
                    ApplicationArea = All;
                }
                field(EnergyMultiplier; Rec.EnergyMultiplier)
                {
                    Caption = 'Multiplicador de energía';
                    ApplicationArea = All;
                }
                field(MinGrade; Rec.MinGrade)
                {
                    Caption = 'Grado mínimo';
                    ApplicationArea = All;
                }
                field(IsActive; Rec.IsActive)
                {
                    Caption = 'Activa';
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
