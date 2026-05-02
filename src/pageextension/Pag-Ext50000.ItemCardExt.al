pageextension 50000 "Item Card Ext" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            group(CursedDataGroup)
            {
                Caption = 'Cursed Data';

                field(IsCursedWeapon; Rec.IsCursedWeapon)
                {
                    ApplicationArea = All;
                    Caption = 'Is Cursed Weapon';

                }
                field(CursedGrade; Rec.CursedGrade)
                {
                    ApplicationArea = All;
                    Caption = 'Cursed Grade';
                }
                field(QuickThreatLevel; Rec.QuickThreatLevel)
                {
                    ApplicationArea = All;
                    Caption = 'Threat Level';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(ViewCursedWeapon)
            {
                Caption = 'View Cursed Weapon';
                ApplicationArea = All;
                Image = Item;
                Visible = Rec.IsCursedWeapon;
                trigger OnAction()
                var
                    CursedWeapon: Record "Cursed Weapon";
                    CursedWeaponCard: Page "Cursed Weapon Card";
                begin
                    if CursedWeapon.Get(Rec."No.") then begin
                        CursedWeaponCard.SetRecord(CursedWeapon);
                        CursedWeaponCard.Run();
                    end;
                end;
            }
        }
    }
}
