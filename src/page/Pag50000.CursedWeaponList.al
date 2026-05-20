page 50000 "Cursed Weapon List"
{
    PageType = List;
    SourceTable = "Cursed Weapon";
    Caption = 'Armas malditas';
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
                    Caption = 'Número';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Descripción';
                    ApplicationArea = All;
                }
                field(CursedGrade; Rec.CursedGrade)
                {
                    Caption = 'Grado maldito';
                    ApplicationArea = All;
                }
                field(WeaponStatus; Rec.WeaponStatus)
                {
                    Caption = 'Estado del arma';
                    ApplicationArea = All;
                    StyleExpr = StatusStyle;
                }
                field(ThreatLevel; Rec.ThreatLevel)
                {
                    Caption = 'Nivel de amenaza';
                    ApplicationArea = All;
                }
                field(ForgerName; Rec.ForgerName)
                {
                    Caption = 'Nombre del forjador';
                    ApplicationArea = All;
                }
                field(InnateTeq; Rec.InnateTeq)
                {
                    Caption = 'Técnica innata';
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
