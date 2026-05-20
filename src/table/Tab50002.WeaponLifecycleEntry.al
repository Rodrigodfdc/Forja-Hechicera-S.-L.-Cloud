table 50002 "Weapon Lifecycle Entry"
{
    DataClassification = CustomerContent;
    Caption = 'Ciclo de vida del arma';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Número de entrada';
            AutoIncrement = true;
        }
        field(2; "Weapon No."; Code[20])
        {
            Caption = 'Número del arma';
            TableRelation = "Cursed Weapon";
        }
        field(3; EntryDate; DateTime)
        {
            Caption = 'Fecha de entrada';
        }
        field(4; OldStatus; Enum "Weapon Status")
        {
            Caption = 'Antiguo status';
        }
        field(5; NewStatus; Enum "Weapon Status")
        {
            Caption = 'Nuevo estatus';
        }
        field(6; Reason; Text[150])
        {
            Caption = 'Motivo';
        }
        field(7; UserID; Code[50])
        {
            Caption = 'ID de Usuario';
        }
        field(8; ThreatLevelAtEntry; Decimal)
        {
            Caption = 'Nivel de amenaza en la entrada';
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(Weapon; "Weapon No.", EntryDate) { }
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