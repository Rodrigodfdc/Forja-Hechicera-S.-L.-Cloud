page 50003 "Cursed Techniques List"
{
    PageType = List;
    SourceTable = "Cursed Technique";
    Caption = 'Técnicas malditas';
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
        }
    }
}
