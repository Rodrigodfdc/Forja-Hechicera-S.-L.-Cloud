table 50000 CursedWeapon
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Integer)
        {

            Caption = 'No', Comment = 'ESP="Numero de serie"';
            AutoIncrement = true;
            Editable = false;
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }

        field(2; ItemNo; Code[20])
        {
            Caption = 'Item No', Comment = 'ESP="Numero de serie Item"';
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description', Comment = 'ESP="Descripción"';
            DataClassification = ToBeClassified;
        }

        field(4; CursedGrade; Enum CursedGrade)
        {
            Caption = 'CurseGrade', Comment = 'ESP="Grado de maldición"';
            DataClassification = ToBeClassified;
        }

        field(5; WeaponStatus; Enum WeaponStatus)
        {
            Caption = 'Weapon Status', Comment = 'ESP="Estado del arma"';
            DataClassification = ToBeClassified;
        }

        field(6; InnateTeq; Enum CurseTechniqueType)
        {
            Caption = 'InnateTeq', Comment = 'ESP="Técnica innata"';
            DataClassification = ToBeClassified;
        }

        field(7; ForgerName; text[50])
        {
            Caption = 'ForgerName', Comment = 'ESP="Nombre del forjador"';
            DataClassification = ToBeClassified;
        }

        field(8; BindingVows; Decimal)
        {
            Caption = 'BindingVows', Comment = 'ESP="Voto vinculante"';
            DataClassification = ToBeClassified;
            // Va a ser un campo calculado
        }

        field(9; ThreatLevel; Decimal)
        {
            Caption = 'ThreatLevel', Comment = 'ESP="Nivel de amenaza"';
            DataClassification = ToBeClassified;
        }

        field(10; ForgeDate; Date)
        {
            Caption = 'ForgeDate', Comment = 'ESP="Fecha de forja"';
            DataClassification = ToBeClassified;
        }

        field(11; SoldToCustomerNo; Code[20])
        {
            Caption = 'SoldToCustomerNo', Comment = 'ESP="Numero de venta al cliente"';
            DataClassification = ToBeClassified;
            //FK->Customer (se rellena al contabilizar el albaran)
        }

        field(12; Notes; Text[500])
        {
            Caption = 'Notas', Comment = 'ESP="Notas"';
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