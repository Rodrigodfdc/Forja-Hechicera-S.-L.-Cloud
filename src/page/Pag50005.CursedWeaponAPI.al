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
                field(no; Rec."No.") { }
                field(description; Rec.Description) { }
                field(cursedGrade; Rec.CursedGrade) { }
                field(weaponStatus; Rec.WeaponStatus) { }
                field(threatLevel; Rec.ThreatLevel) { }
                field(forgerName; Rec.ForgerName) { }
                field(innateTeq; Rec.InnateTeq) { }
                field(forgeDate; Rec.ForgeDate) { }
            }
        }
    }
}
