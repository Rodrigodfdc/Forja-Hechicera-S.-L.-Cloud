pageextension 50000 "Item Card Ext" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            group(CursedDataGroup)
            {
                Caption = 'Datos del arma maldita';

                field(IsCursedWeapon; Rec.IsCursedWeapon)
                {
                    Caption = '¿Es un arma maldita?';
                    ApplicationArea = All;
                }
                field(CursedGrade; Rec.CursedGrade)
                {
                    Caption = 'Grado maldito';
                    ApplicationArea = All;

                }
                field(QuickThreatLevel; Rec.QuickThreatLevel)
                {
                    Caption = 'Nivel de amenaza';
                    ApplicationArea = All;
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
