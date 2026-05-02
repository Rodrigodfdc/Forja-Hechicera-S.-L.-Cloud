pageextension 50002 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(CursedWeaponInfo; "Weapon Lifecycle List Part")
            {
                ApplicationArea = All;
                Caption = 'Cursed Weapon Info';
                SubPageLink = "Weapon No." = field("No.");
            }
        }
    }
}

