page 50001 "Cursed Weapon Card"
{
    PageType = Card;
    SourceTable = "Cursed Weapon";
    Caption = 'Cursed Weapon Card';
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Weapon identifier.';
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
                field(InnateTeq; Rec.InnateTeq)
                {
                    ApplicationArea = All;
                }
                field(ThreatLevel; Rec.ThreatLevel)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(ForgeDetails)
            {
                Caption = 'Forge Details';
                field(ForgerName; Rec.ForgerName)
                {
                    ApplicationArea = All;
                }
                field(ForgeDate; Rec.ForgeDate)
                {
                    ApplicationArea = All;
                }
                field(BindingVows; Rec.BindingVows)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
            group(SaleInfo)
            {
                Caption = 'Sale Information';
                field(SoldToCustomerNo; Rec.SoldToCustomerNo)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(Notes)
            {
                Caption = 'Notes';
                field(NotesField; Rec.Notes)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    MultiLine = true;
                }
            }
        }
        area(FactBoxes)
        {
            part(LifecyclePart; "Weapon Lifecycle List Part")
            {
                ApplicationArea = All;
                Caption = 'Lifecycle History';
                SubPageLink = "Weapon No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CalculateThreat)
            {
                Caption = 'Calculate Threat Level';
                ApplicationArea = All;
                Image = Calculate;
                trigger OnAction()
                var
                    Mgt: Codeunit "Cursed Weapon Mgt";
                begin
                    Mgt.CalculateThreatLevel(Rec."No.");
                    Rec.Get(Rec."No.");
                    CurrPage.Update(false);
                end;
            }
            action(ChangeStatus)
            {
                Caption = 'Change Status';
                ApplicationArea = All;
                Image = ChangeStatus;
                trigger OnAction()
                var
                    Mgt: Codeunit "Cursed Weapon Mgt";
                    NewStatus: Enum "Weapon Status";
                    Reason: Text[150];
                begin
                    // Aqui puedes abrir un dialogo o pedir al usuario el nuevo estado
                    // Simplificado: cambia a Active como ejemplo
                    Reason := 'Manual status change';
                    Mgt.ChangeWeaponStatus(Rec."No.", NewStatus, Reason);
                    Rec.Get(Rec."No.");
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

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        NoSeriesMgt: Codeunit "NoSeriesManagement";
    begin
        if Rec."No." = '' then
            NoSeriesMgt.InitSeries('CW', '', Today, Rec."No.", Rec."No. Series");
        Rec.WeaponStatus := Rec.WeaponStatus::Dormant;
    end;
}
