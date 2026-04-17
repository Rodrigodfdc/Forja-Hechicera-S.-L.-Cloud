table 50001 CursedTechnique
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[10])
        {
            Caption = 'No', Comment = 'ESP="Código"';
            DataClassification = ToBeClassified;
        }

        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; EnergyMultipler; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; MinGrade; Enum CursedGrade)
        {
            DataClassification = ToBeClassified;
        }
        field(6; IsActive; Boolean)
        {
            DataClassification = ToBeClassified;
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