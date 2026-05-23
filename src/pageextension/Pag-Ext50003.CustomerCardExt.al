pageextension 50003 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            group(CursedAuthorization)
            {
                Caption = 'Autorización de armas malditas';

                field(SeniorHechiceroAuthorized; Rec.SeniorHechiceroAuthorized)
                {
                    ApplicationArea = All;
                    Caption = '¿Autorizado como Hechicero Senior?';
                    ToolTip = 'De ser cierto, el cliente podrá comprar armas malditas';
                }
                field(MaxCursedGrade; Rec.MaxCursedGrade)
                {
                    ApplicationArea = All;
                    Caption = 'Grado máximo maldito';
                    ToolTip = 'El grado máximo de arma maldita que el cliente puede comprar.';
                }
            }
        }
    }
}
