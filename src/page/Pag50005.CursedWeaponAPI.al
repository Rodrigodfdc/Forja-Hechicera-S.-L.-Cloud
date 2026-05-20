page 50005 "Cursed Weapon API"
{
    Caption = 'API de Armas Malditas';
    PageType = API;
    APIGroup = 'cursedWeapons';
    APIPublisher = 'forjaHechicera';
    APIVersion = 'v1.0';
    EntityName = 'cursedWeapon';
    EntitySetName = 'cursedWeapons';
    SourceTable = "Cursed Weapon";
    Editable = false;
    ODataKeyFields = "No.";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(no; Rec."No.")
                {
                    Caption = 'Número';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Descripción';
                    ApplicationArea = All;
                }
                field(cursedGrade; Rec.CursedGrade)
                {
                    Caption = 'Grado maldito';
                    ApplicationArea = All;
                }
                field(weaponStatus; Rec.WeaponStatus)
                {
                    Caption = 'Estado del arma';
                    ApplicationArea = All;
                }
                field(threatLevel; Rec.ThreatLevel)
                {
                    Caption = 'Nivel de amenaza';
                    ApplicationArea = All;
                }
                field(forgerName; Rec.ForgerName)
                {
                    Caption = 'Nombre del forjador';
                    ApplicationArea = All;
                }
                field(innateTeq; Rec.InnateTeq)
                {
                    Caption = 'Técnica innata';
                    ApplicationArea = All;
                }
                field(forgeDate; Rec.ForgeDate)
                {
                    Caption = 'Fecha de forja';
                    ApplicationArea = All;
                }
            }
        }
    }
}
