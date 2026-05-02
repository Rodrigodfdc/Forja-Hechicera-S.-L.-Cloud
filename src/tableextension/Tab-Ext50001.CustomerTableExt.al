tableextension 50001 "Customer Table Ext" extends Customer
{
    fields
    {
        field(50100; SeniorHechiceroAuthorized; Boolean)
        {
            Caption = 'Senior Hechicero Authorized';
            DataClassification = CustomerContent;
        }
        field(50101; MaxCursedGrade; Enum "Cursed Grade")
        {
            Caption = 'Max Cursed Grade';
            DataClassification = CustomerContent;
        }
    }
}
