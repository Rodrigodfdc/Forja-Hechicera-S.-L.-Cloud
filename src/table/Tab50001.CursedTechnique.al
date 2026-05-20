table 50001 "Cursed Technique"
{
    DataClassification = CustomerContent;
    Caption = 'Técnica maldita';

    fields
    {
        field(1; Code; Code[10])
        {
            Caption = 'Código';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Nombre';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Descripción';
        }
        field(4; EnergyMultiplier; Decimal)
        {
            Caption = 'Multiplicador de energía';
            DecimalPlaces = 2 : 2;
            MinValue = 0.1;
        }
        field(5; MinGrade; Enum "Cursed Grade")
        {
            Caption = 'Min. Grado requerido';
        }
        field(6; IsActive; Boolean)
        {
            Caption = '¿Está Activa?';
            InitValue = true;
        }
    }

    keys
    {
        key(PK; Code) { Clustered = true; }
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