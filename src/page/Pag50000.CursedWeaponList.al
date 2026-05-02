page 50000 "Cursed Weapon List"
{
    PageType = List;
    SourceTable = "Cursed Weapon";
    Caption = 'Cursed Weapons';
    CardPageId = "Cursed Weapon Card";
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(WeaponList)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(CursedGrade; Rec.CursedGrade)
                {
                    ApplicationArea = All;
                }
                field(WeaponStatus; Rec.WeaponStatus)
                {
                    ApplicationArea = All;
                    StyleExpr = StatusStyle;
                }
                field(ThreatLevel; Rec.ThreatLevel)
                {
                    ApplicationArea = All;
                }
                field(ForgerName; Rec.ForgerName)
                {
                    ApplicationArea = All;
                }
                field(InnateTeq; Rec.InnateTeq)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CalculateAll)
            {
                Caption = 'Recalculate All Threat Levels';
                ApplicationArea = All;
                Image = Calculate;
                trigger OnAction()
                var
                    CursedWeapon: Record "Cursed Weapon";
                    Mgt: Codeunit "Cursed Weapon Mgt";
                begin
                    if CursedWeapon.FindSet() then
                        repeat
                            Mgt.CalculateThreatLevel(CursedWeapon."No.");
                        until CursedWeapon.Next() = 0;
                    CurrPage.Update(false);
                end;
            }
        }
    }

    var
        StatusStyle: Text;

    trigger OnAfterGetRecord()
    begin
        case Rec.WeaponStatus of
            Rec.WeaponStatus::Active:
                StatusStyle := 'Favorable';
            Rec.WeaponStatus::Sold:
                StatusStyle := 'Strong';
            Rec.WeaponStatus::Sealed:
                StatusStyle := 'Attention';
            Rec.WeaponStatus::Destroyed:
                StatusStyle := 'Unfavorable';
            else
                StatusStyle := 'StandardAccent';
        end;
    end;
}
