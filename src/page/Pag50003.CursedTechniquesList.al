page 50003 CursedTechniquesList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CursedTechnique;
    CardPageId = CursedTechniquesCard;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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

                field(EnergyMultipler; Rec.EnergyMultipler)
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
                    Caption = '¿Está activo?';
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    Caption = 'Código';
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