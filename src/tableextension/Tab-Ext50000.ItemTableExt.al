tableextension 50000 "Item Table Ext" extends Item
{
    fields
    {
        field(50100; IsCursedWeapon; Boolean)
        {
            Caption = '¿Es un arma maldita?';
            DataClassification = CustomerContent;


        }
        field(50101; CursedGrade; Enum "Cursed Grade")
        {
            Caption = 'Grado maldito';
            DataClassification = CustomerContent;
        }
        field(50102; QuickThreatLevel; Decimal)
        {
            Caption = 'Nivel de amenaza';
            FieldClass = FlowField;
            CalcFormula = lookup("Cursed Weapon".ThreatLevel
                where(ItemNo = field("No.")));
            Editable = false;
        }
    }
}
