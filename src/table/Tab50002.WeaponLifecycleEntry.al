table 50002 WeaponLifecycleEntry
{

    // Lore — El libro del destino de cada arma En JJK, la historia de un arma maldita queda grabada en su energía. 
    // La Katana de Toji Fushiguro ha pasado por múltiples manos y cada combate la ha marcado. WeaponLifecycleEntry es el equivalente digital: 
    // un registro cronológico e inmutable de cada cambio de estado. Igual que los G/L Entries del estándar de BC guardan cada apunte contable para siempre, 
    // esta tabla guarda cada momento clave del ciclo de vida del arma.


    DataClassification = ToBeClassified;

    fields
    {
        field(1; EntryNo; Integer)
        {
            AutoIncrement = true;
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
            // -> Numero secuencial. Se calcula con FindLast()+1 igual que G/L Entry
        }
        field(2; WeaponNo; Code[20])
        {
            DataClassification = ToBeClassified;
            // -> Arma a la que pertenece este registro
        }
        field(3; EntryDate; DateTime)
        {
            DataClassification = ToBeClassified;
            // -> Fecha y hora exacta del cambio — CurrentDateTime()
        }
        field(4; OldStatus; Enum WeaponStatus)
        {
            DataClassification = ToBeClassified;
            // -> Estado anterior al cambio — leido antes de modificar CursedWeapon
        }
        field(5; NewStatus; Enum WeaponStatus)
        {
            DataClassification = ToBeClassified;
            // -> Nuevo estado tras el cambio
        }
        field(6; Reason; Text[150])
        {
            DataClassification = ToBeClassified;
            // -> Motivo — ej: Assembly Order completado, Vendida a Organizacion Hechiceros
        }
        field(7; UserID; Integer)
        {
            DataClassification = ToBeClassified;
            // -> Usuario BC que realizo la accion — UserId()
        }
        field(8; ThreatLevelAtEntry; Decimal)
        {
            DataClassification = ToBeClassified;
            // -> Snapshot del ThreatLevel en el momento del cambio — para trazabilidad historica
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