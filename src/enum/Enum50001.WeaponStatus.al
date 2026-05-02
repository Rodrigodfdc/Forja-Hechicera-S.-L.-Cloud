enum 50001 "Weapon Status"
{
    Extensible = true;

    value(0; "Dormant")
    {
        Caption = 'Dormant';
    }   // Estado inicial al crear
    value(1; "Active")
    {
        Caption = 'Active';
    }    // Al completar Assembly Order
    value(2; "Sealed")
    {
        Caption = 'Sealed';
    }    // Sellada temporalmente
    value(3; "Destroyed")
    {
        Caption = 'Destroyed';
    } // Destruida
    value(4; "Sold")
    {
        Caption = 'Sold';
    }      // Al contabilizar albaran
}
