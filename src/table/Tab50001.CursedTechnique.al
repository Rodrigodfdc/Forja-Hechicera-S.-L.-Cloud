table 50001 "Cursed Technique"
{
    DataClassification = CustomerContent;
    Caption = 'Cursed Technique';

    fields
    {
        field(1; Code; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; EnergyMultiplier; Decimal)
        {
            Caption = 'Energy Multiplier';
            DecimalPlaces = 2 : 2;
            MinValue = 0.1;
        }
        field(5; MinGrade; Enum "Cursed Grade")
        {
            Caption = 'Min. Grade Required';
        }
        field(6; IsActive; Boolean)
        {
            Caption = 'Is Active';
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