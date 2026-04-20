page 50000 CursedWeaponList
{
    // Lista principal de armas malditas. Es el punto de entrada al módulo desde el menu de BC. El usuario puede ver todas las armas, 
    // filtrar por grado o estado y hacer clic en cualquiera para abrir la ficha completa.

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CursedWeapon;
    CardPageId = CursedWeaponCard;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    // -> Abre CursedWeaponCard al hacer clic — propiedad CardPageId
                }

                field(Description; Rec.Description)
                {
                    Caption = 'Descripción';
                    ApplicationArea = All;
                    // -> Descripción del arma maldita
                }

                field(CursedGrade; Rec.CursedGrade)
                {
                    Caption = 'Grado maldición';
                    ApplicationArea = All;
                    // -> Filtro rapido disponible en la cabecera
                }

                field(WeaponStatus; Rec.WeaponStatus)
                {
                    Caption = 'Estado del arma';
                    ApplicationArea = All;
                    // -> Filtro rapido disponible
                }

                field(ThreatLevel; Rec.ThreatLevel)
                {
                    Caption = 'Nivel de amenaza';
                    ApplicationArea = All;
                    // -> Ordenable descendente — columna destacada
                }

                field(ForgerName; Rec.ForgerName)
                {
                    Caption = 'Nombre del forjador';
                    ApplicationArea = All;
                    // -> Nombre del forjador
                }

                field(InnateTeq; Rec.InnateTeq)
                {
                    Caption = 'Técnica innata';
                    ApplicationArea = All;
                    // -> técnica innata
                }

            }

        }

        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}