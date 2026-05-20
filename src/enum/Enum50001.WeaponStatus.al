enum 50001 "Weapon Status"
{
    Caption = 'Estado del arma';
    Extensible = true;

    value(0; "Dormant")
    {
        // Estado inicial al crear
        Caption = 'Inactivo';
    }
    value(1; "Active")
    {   // Al completar Assembly Order
        Caption = 'Activo';
    }
    value(2; "Sealed")
    {   // Sellada temporalmente
        Caption = 'Sellada temporalmente';
    }
    // Sellada temporalmente
    value(3; "Destroyed")
    {
        // Destruida
        Caption = 'Destruida';
    }
    value(4; "Sold")
    {
        Caption = 'Vendida';
    }      // Al contabilizar albaran
}
