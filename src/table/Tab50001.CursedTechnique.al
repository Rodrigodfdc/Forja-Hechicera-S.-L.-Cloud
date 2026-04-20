table 50001 CursedTechnique
{
    DataClassification = ToBeClassified;

    // Catalogo maestro de técnicas malditas. Desde aquí se controla el multiplicador de energía que entra en la fórmula de ThreatLevel. 
    // Esta tabla es de configuración — la rellena el administrador del sistema, no los usuarios finales.

    fields
    {
        field(1; Code; Code[10])
        {
            Caption = 'No', Comment = 'ESP="Código"';
            DataClassification = ToBeClassified;
            //-> Codigo corto unico — INF, NEG, TET, RES, UNK, NON
        }

        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
            //-> Nombre completo de la tecnica
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
            //-> Descripcion detallada de como funciona la tecnica
        }
        field(4; EnergyMultipler; Decimal)
        {
            DataClassification = ToBeClassified;
            //-> Multiplicador para ThreatLevel — Infinity=3.0, NegCalm=2.0, None=1.0
        }
        field(5; MinGrade; Enum CursedGrade)
        {
            DataClassification = ToBeClassified;
            //-> Grado minimo del portador para que la tecnica sea efectiva
        }
        field(6; IsActive; Boolean)
        {
            DataClassification = ToBeClassified;
            //-> Permite desactivar tecnicas sin borrarlas — util para armas descatalogadas
        }

    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}