table 50002 WeaponLifecycleEntry
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; WeaponNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; EntryDate; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; OldStatus; Enum WeaponStatus)
        {
            DataClassification = ToBeClassified;
        }
        field(5; NewStatus; Enum WeaponStatus)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Reason; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; MyField; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; EntryNo)
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