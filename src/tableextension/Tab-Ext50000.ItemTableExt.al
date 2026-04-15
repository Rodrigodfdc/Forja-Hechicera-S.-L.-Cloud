tableextension 50000 ItemTableExt extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50001; IdCursedWeapon; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = CursedWeapon;
        }

        field(50002; IsCursedWeapon; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; CursedGrade; Enum CursedGrade)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; QuickThreatLevel; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        // Add changes to keys here
        key(Key1; IdCursedWeapon) // ---> no podemos mezclar nuestra extensión con la del sistema
        {

        }

    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}