pageextension 50003 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            group(CursedAuthorization)
            {
                Caption = 'Cursed Authorization';

                field(SeniorHechiceroAuthorized; Rec.SeniorHechiceroAuthorized)
                {
                    ApplicationArea = All;
                    Caption = 'Senior Hechicero Authorized';
                    ToolTip = 'If true, customer can buy Grade 1 and Special weapons.';
                }
                field(MaxCursedGrade; Rec.MaxCursedGrade)
                {
                    ApplicationArea = All;
                    Caption = 'Max Cursed Grade';
                }
            }
        }
    }
}
