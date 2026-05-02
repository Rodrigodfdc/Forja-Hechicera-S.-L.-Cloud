codeunit 50001 "Cursed Weapon Events"
{
    // ── Suscriptor 1b ─────────────────────────────────────────────────
    // Cuando se modifica un articulo existente y se activa IsCursedWeapon,
    // crea el registro en CursedWeapon si no existia ya.
    [EventSubscriber(ObjectType::Table, Database::Item, 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyItem(var Rec: Record Item; var xRec: Record Item; RunTrigger: Boolean)
    var
        Mgt: Codeunit "Cursed Weapon Mgt";
    begin
        if Rec.IsCursedWeapon and not xRec.IsCursedWeapon then
            Mgt.CreateCursedWeaponFromItem(Rec."No.");
    end;

    // ── Suscriptor 2 ──────────────────────────────────────────────────
    // Antes de liberar un pedido de venta, valida que el cliente
    // tiene autorizacion para el grado de cada arma maldita en las lineas.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', false, false)]
    local procedure OnBeforeReleaseSalesDoc(var SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        CursedWeapon: Record "Cursed Weapon";
        Mgt: Codeunit "Cursed Weapon Mgt";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.FindSet() then
            repeat
                if CursedWeapon.Get(SalesLine."No.") then
                    Mgt.ValidateSaleAuthorization(
                        SalesLine."No.",
                        SalesHeader."Sell-to Customer No.");
            until SalesLine.Next() = 0;
    end;

    // ── Suscriptor 3 ──────────────────────────────────────────────────
    // Al completar un ensamblado, cambia el estado del arma
    // de Dormant a Active y recalcula el ThreatLevel.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly-Post", 'OnAfterPost', '', false, false)]
    local procedure OnAfterPostAssemblyOrder(var AssemblyHeader: Record "Assembly Header")
    var
        CursedWeapon: Record "Cursed Weapon";
        Mgt: Codeunit "Cursed Weapon Mgt";
    begin
        if CursedWeapon.Get(AssemblyHeader."Item No.") then begin
            Mgt.ChangeWeaponStatus(
                AssemblyHeader."Item No.",
                CursedWeapon.WeaponStatus::Active,
                'Assembly Order completed');
            Mgt.CalculateThreatLevel(AssemblyHeader."Item No.");

            // Rellenar la fecha de forja
            if CursedWeapon.Get(AssemblyHeader."Item No.") then begin
                CursedWeapon.ForgeDate := Today;
                CursedWeapon.Modify(true);
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesShipLine(
        var SalesHeader: Record "Sales Header";
        SalesInvHdrNo: Code[20];
        RetRcpHdrNo: Code[20];
        SalesCrMemoHdrNo: Code[20])
    var
        SalesLine: Record "Sales Line";
        CursedWeapon: Record "Cursed Weapon";
        Mgt: Codeunit "Cursed Weapon Mgt";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.FindSet() then
            repeat
                if CursedWeapon.Get(SalesLine."No.") then begin
                    Mgt.ChangeWeaponStatus(
                        SalesLine."No.",
                        CursedWeapon.WeaponStatus::Sold,
                        StrSubstNo('Sold via Sales Order %1', SalesLine."Document No."));
                    CursedWeapon.Get(SalesLine."No.");
                    CursedWeapon.SoldToCustomerNo := SalesHeader."Sell-to Customer No.";
                    CursedWeapon.Modify(true);
                end;
            until SalesLine.Next() = 0;
    end;
}
