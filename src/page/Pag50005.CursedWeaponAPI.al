page 50005 "Cursed Weapon API"
{
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
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(cursedGrade; Rec.CursedGrade)
                {
                    ApplicationArea = All;
                }
                field(weaponStatus; Rec.WeaponStatus)
                {
                    ApplicationArea = All;
                }
                field(threatLevel; Rec.ThreatLevel)
                {
                    ApplicationArea = All;
                }
                field(forgerName; Rec.ForgerName)
                {
                    ApplicationArea = All;
                }
                field(innateTeq; Rec.InnateTeq)
                {
                    ApplicationArea = All;
                }
                field(forgeDate; Rec.ForgeDate)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
