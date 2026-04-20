tableextension 50000 ItemTableExt extends Item
{
    // Extiende la tabla Item estandar de BC sin modificar su codigo fuente. 
    // Anade tres campos que permiten identificar y filtrar armas malditas directamente desde la lista de articulos 
    // sin necesidad de ir a la tabla CursedWeapon.

    fields
    {
        // Add changes to table fields here
        field(50001; IdCursedWeapon; Boolean)
        {
            DataClassification = ToBeClassified;
            TableRelation = CursedWeapon;
            //-> Marca el articulo como arma maldita. Al activarse desde ItemCardExt, dispara CreateCursedWeaponFromItem() via OnAfterValidate
        }

        field(50002; CursedGrade; Enum CursedGrade)
        {
            DataClassification = ToBeClassified;
            //-> Grado visible en la lista de articulos sin abrir la ficha. Se sincroniza con CursedWeapon.CursedGrade
        }

        field(50003; QuickThreatLevel; Decimal)
        {
            DataClassification = ToBeClassified;
            //-> CalcFormula lookup a CursedWeapon.ThreatLevel via ItemNo. Siempre actualizado, sin duplicar datos en SQL
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