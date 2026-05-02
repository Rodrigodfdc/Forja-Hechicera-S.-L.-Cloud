pageextension 50001 "Item List Ext" extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field(IsCursedWeapon; Rec.IsCursedWeapon)
            {
                ApplicationArea = All;
                Caption = 'Cursed';
                Width = 5;
            }
            field(CursedGrade; Rec.CursedGrade)
            {
                ApplicationArea = All;
                Caption = 'Grade';
            }
        }
    }

    views
    {
        addfirst
        {
            view(CursedWeaponsFilter)
            {
                Caption = 'Cursed Weapons';
                Filters = where(IsCursedWeapon = const(true));
            }
        }
    }
}
