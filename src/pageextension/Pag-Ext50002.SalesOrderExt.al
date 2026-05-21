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
                Provider = SalesLines; // CORRECCIÓN: Enlaza el contexto a las líneas del pedido
                SubPageLink = "Weapon No." = field("No."); // Ahora field("No.") evaluará el "No." de la línea (el Item/Arma)
            }
        }
    }
}

