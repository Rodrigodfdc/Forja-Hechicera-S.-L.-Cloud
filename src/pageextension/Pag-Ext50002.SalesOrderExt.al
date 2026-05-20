pageextension 50002 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(CursedWeaponInfo; "Weapon Lifecycle List Part")
            {
                ApplicationArea = All;
                Caption = 'Información de arma maldita';
                SubPageLink = "Weapon No." = field("No.");
            }
        }
    }
}

