table 50000 CursedWeapon
{
    DataClassification = ToBeClassified;

    // Lore — El registro de cada arma En Forja Hechicera, cada arma especial es única e irrepetible.
    // La Katana de Toji no es un producto de stock anónimo — es una pieza con historia, con un forjador conocido, con votos de vinculación específicos
    // y con un nivel de amenaza medido. Esta tabla es el equivalente al DNI de cada arma del catálogo.

    fields
    {
        field(1; No; Integer)
        {
            Caption = 'No', Comment = 'ESP="Numero de serie"';
            AutoIncrement = true;
            Editable = false;
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            //-> Código del arma — mismo valor que Item.No.
        }

        field(2; ItemNo; Code[20])
        {
            Caption = 'Item No', Comment = 'ESP="Numero de serie Item"';
            DataClassification = ToBeClassified;
            //-> Articulo estándar BC vinculado vía TableRelation
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description', Comment = 'ESP="Descripción"';
            DataClassification = ToBeClassified;
            // -> Nombre descriptivo del arma
        }

        field(4; CursedGrade; Enum CursedGrade)
        {
            Caption = 'CurseGrade', Comment = 'ESP="Grado de maldición"';
            DataClassification = ToBeClassified;
            // --> Grado de maldicion — controla restricciones de venta en ValidateSaleAuthorization
        }

        field(5; WeaponStatus; Enum WeaponStatus)
        {
            Caption = 'Weapon Status', Comment = 'ESP="Estado del arma"';
            DataClassification = ToBeClassified;
            //-> Estado actual — NUNCA se cambia directamente, solo via ChangeWeaponStatus()
        }

        field(6; InnateTeq; Enum CurseTechniqueType)
        {
            Caption = 'InnateTeq', Comment = 'ESP="Técnica innata"';
            DataClassification = ToBeClassified;
            // -> Tecnica innata — su EnergyMultiplier entra en CalculateThreatLevel
        }

        field(7; ForgerName; text[50])
        {
            Caption = 'ForgerName', Comment = 'ESP="Nombre del forjador"';
            DataClassification = ToBeClassified;
            // -> Nombre del forjador — se usa para rastrear la responsabilidad
        }

        field(8; BindingVows; Decimal)
        {
            Caption = 'BindingVows', Comment = 'ESP="Voto vinculante"';
            DataClassification = ToBeClassified;
            // Votos de vinculacion — si no esta vacio, ThreatLevel recibe +20% de bonus
        }

        field(9; ThreatLevel; Decimal)
        {
            Caption = 'ThreatLevel', Comment = 'ESP="Nivel de amenaza"';
            DataClassification = ToBeClassified;
            // -> Nivel de amenaza calculado por CursedWeaponMgt.CalculateThreatLevel() — no editable

        }

        field(10; ForgeDate; Date)
        {
            Caption = 'ForgeDate', Comment = 'ESP="Fecha de forja"';
            DataClassification = ToBeClassified;
            // ->  Fecha de forja — se rellena automaticamente al completar el Assembly Order
        }

        field(11; SoldToCustomerNo; Code[20])
        {
            Caption = 'SoldToCustomerNo', Comment = 'ESP="Numero de venta al cliente"';
            DataClassification = ToBeClassified;
            //FK-> Customer (se rellena al contabilizar el albarán)
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