table 50000 "Cursed Weapon"
{
    DataClassification = CustomerContent;
    Caption = 'Arma maldita';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = Item;
        }
        field(2; ItemNo; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Descripción';
        }
        field(4; CursedGrade; Enum "Cursed Grade")
        {
            Caption = 'Grado maldito';
        }
        field(5; WeaponStatus; Enum "Weapon Status")
        {
            Caption = 'Estado del arma';
            Editable = false; // Solo via CursedWeaponMgt.ChangeWeaponStatus()
        }
        field(6; InnateTeq; Enum "Cursed Technique Type")
        {
            Caption = 'Técnica innata';
        }
        field(7; ForgerName; Text[50])
        {
            Caption = 'Nombre del forjador';
        }
        field(8; BindingVows; Text[250])
        {
            Caption = 'votos vinculantes';
        }
        field(9; ThreatLevel; Decimal)
        {
            Caption = 'Nivel de amenaza';
            Editable = false;
            DecimalPlaces = 2 : 2;
        }
        field(10; ForgeDate; Date)
        {
            Caption = 'Fecha de forja';
        }
        field(11; SoldToCustomerNo; Code[20])
        {
            Caption = 'Número de cliente al que se vendió';
            TableRelation = Customer;
            Editable = false;
        }
        field(12; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(13; Notes; Text[500])
        {
            Caption = 'Notes';
        }
    }

    keys
    {
        key(PK; "No.") { Clustered = true; }
        key(Grade; CursedGrade) { }
        key(Status; WeaponStatus) { }
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