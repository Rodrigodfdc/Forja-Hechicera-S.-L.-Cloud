page 50004 CursedTechniquesCard
{
    // Ficha de tecnica maldita. Todos los campos editables. 
    // Necesaria para editar el campo Description que es multilinea y no se muestra bien en la lista.

    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = CursedTechnique;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Code; Rec.Code)
                {
                    Caption = 'Código';
                    ApplicationArea = All;
                    // -> PK — INF, NEG, TET...
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Nombre';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Descripción';
                    ApplicationArea = All;
                    // -> MultiLine = true
                }
                field(EnergyMultipler; Rec.EnergyMultipler)
                {
                    Caption = 'Multiplicador energía';
                    ApplicationArea = All;
                    // -> Decimal — formato 0.00
                }
                field(MinGrade; Rec.MinGrade)
                {
                    Caption = 'Minimo grado';
                    ApplicationArea = All;
                    // -> Desplegable con CursedGrade
                }
                field(IsActive; Rec.IsActive)
                {
                    Caption = 'Está activo';
                    ApplicationArea = All;
                    // -> Checkbox
                }
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