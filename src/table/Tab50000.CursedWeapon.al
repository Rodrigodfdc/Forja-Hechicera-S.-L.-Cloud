table 50000 CursedWeapon
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; ItemNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(4; CursedGrade; Enum CursedGrade)
        {
            DataClassification = ToBeClassified;
        }

        field(5; WeaponStatus; Enum WeaponStatus)
        {
            DataClassification = ToBeClassified;
        }

        field(6; InnateTeq; Enum CurseTechniqueType)
        {
            DataClassification = ToBeClassified;
        }

        field(7; ForgerName; text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(8; BindingVows; Decimal)
        {
            DataClassification = ToBeClassified;
            // Va a ser un campo calculado
        }

        field(9; ThreatLevel; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(10; ForgeDate; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(11; SoldToCustomerNo; Code[20])
        {
            DataClassification = ToBeClassified;
            //FK->Customer (se rellena al contabilizar el albaran)
        }

        field(12; Notes; Text[500])
        {
            DataClassification = ToBeClassified;
            //Observaciones libres
        }

    }

    keys
    {
        key(Key1; No)
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