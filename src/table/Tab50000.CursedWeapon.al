table 50000 CursedWeapon
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; IdCursedWeapon; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(2; ItemNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(3; CursedGrade; Enum CursedGrade)
        {
            DataClassification = ToBeClassified;
        }

        field(4; WeaponStatus; Enum WeaponStatus)
        {
            DataClassification = ToBeClassified;
        }

        field(5; InnateTeq; Enum CurseTechniqueType)
        {
            DataClassification = ToBeClassified;
        }

        field(6; ThreatLevel; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(7; ForgerName; text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(8; BindingVows; text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(10; ForgerDate; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(11; SoldToCustomerNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; IdCursedWeapon)
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