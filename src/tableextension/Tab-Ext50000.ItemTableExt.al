tableextension 50000 "Item Table Ext" extends Item
{
    fields
    {
        field(50100; IsCursedWeapon; Boolean)
        {
            Caption = 'Is Cursed Weapon';
            DataClassification = CustomerContent;


        }
        field(50101; CursedGrade; Enum "Cursed Grade")
        {
            Caption = 'Cursed Grade';
            DataClassification = CustomerContent;
        }
        field(50102; QuickThreatLevel; Decimal)
        {
            Caption = 'Threat Level';
            FieldClass = FlowField;
            CalcFormula = lookup("Cursed Weapon".ThreatLevel
                where(ItemNo = field("No.")));
            Editable = false;
        }
    }
}
