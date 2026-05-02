table 50002 "Weapon Lifecycle Entry"
{
    DataClassification = CustomerContent;
    Caption = 'Weapon Lifecycle Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Weapon No."; Code[20])
        {
            Caption = 'Weapon No.';
            TableRelation = "Cursed Weapon";
        }
        field(3; EntryDate; DateTime)
        {
            Caption = 'Entry Date';
        }
        field(4; OldStatus; Enum "Weapon Status")
        {
            Caption = 'Old Status';
        }
        field(5; NewStatus; Enum "Weapon Status")
        {
            Caption = 'New Status';
        }
        field(6; Reason; Text[150])
        {
            Caption = 'Reason';
        }
        field(7; UserID; Code[50])
        {
            Caption = 'User ID';
        }
        field(8; ThreatLevelAtEntry; Decimal)
        {
            Caption = 'Threat Level At Entry';
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