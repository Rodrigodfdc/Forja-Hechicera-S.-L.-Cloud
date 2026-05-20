pageextension 50001 "Item List Ext" extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field(IsCursedWeapon; Rec.IsCursedWeapon)
            {
                ApplicationArea = All;
                Caption = '¿Es un arma maldita?';
                Width = 5;
            }
            field(CursedGrade; Rec.CursedGrade)
            {
                ApplicationArea = All;
                Caption = 'Grado maldito';
            }
        }
    }

    views
    {
        addfirst
        {
            view(CursedWeaponsFilter)
            {
                Caption = 'Armas malditas';
                Filters = where(IsCursedWeapon = const(true));
            }
        }
    }
}
