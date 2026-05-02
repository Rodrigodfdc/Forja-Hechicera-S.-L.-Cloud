codeunit 50000 "Cursed Weapon Mgt"
{
    // ── CalculateThreatLevel ───────────────────────────────────────────
    // Formula: ThreatLevel = GradeBase x EnergyMultiplier x BonusVotos
    // GradeBase: Special=10, SemiGrade1=8, SemiGrade2=6, Grade1=4, Grade2=2, Grade4=1
    // BonusVotos: si BindingVows <> '' -> resultado x 1.2 (+20%)
    procedure CalculateThreatLevel(WeaponNo: Code[20])
    var
        CursedWeapon: Record "Cursed Weapon";
        CursedTechnique: Record "Cursed Technique";
        GradeBase: Decimal;
        Multiplier: Decimal;
        ThreatResult: Decimal;
    begin
        if not CursedWeapon.Get(WeaponNo) then exit;

        // Calcular GradeBase segun el enum
        case CursedWeapon.CursedGrade of
            CursedWeapon.CursedGrade::Special:
                GradeBase := 10;
            CursedWeapon.CursedGrade::SemiGrade1:
                GradeBase := 8;
            CursedWeapon.CursedGrade::SemiGrade2:
                GradeBase := 6;
            CursedWeapon.CursedGrade::Grade1:
                GradeBase := 4;
            CursedWeapon.CursedGrade::Grade2:
                GradeBase := 2;
            CursedWeapon.CursedGrade::Grade4:
                GradeBase := 1;
        end;

        // Obtener multiplicador de la tecnica
        Multiplier := 1.0; // Default si no hay tecnica
        case CursedWeapon.InnateTeq of
            CursedWeapon.InnateTeq::Infinity:
                Multiplier := 3.0;
            CursedWeapon.InnateTeq::NegativeCalm:
                Multiplier := 2.0;
            CursedWeapon.InnateTeq::Tetragrammaton:
                Multiplier := 2.5;
            CursedWeapon.InnateTeq::Resonance:
                Multiplier := 1.8;
            CursedWeapon.InnateTeq::Unknown:
                Multiplier := 1.5;
        end;

        // Calcular resultado base
        ThreatResult := GradeBase * Multiplier;

        // Aplicar bonus si tiene votos de vinculacion
        if CursedWeapon.BindingVows <> '' then
            ThreatResult := ThreatResult * 1.2;

        // Actualizar el campo
        CursedWeapon.ThreatLevel := ThreatResult;
        CursedWeapon.Modify(true);
    end;

    // ── ValidateSaleAuthorization ──────────────────────────────────────
    // Bloquea la venta si el cliente no tiene autorizacion para el grado
    procedure ValidateSaleAuthorization(ItemNo: Code[20]; CustomerNo: Code[20])
    var
        CursedWeapon: Record "Cursed Weapon";
        Customer: Record Customer;
    begin
        if not CursedWeapon.Get(ItemNo) then exit;
        if not Customer.Get(CustomerNo) then exit;

        if CursedWeapon.CursedGrade in
           [CursedWeapon.CursedGrade::Special, CursedWeapon.CursedGrade::Grade1]
        then
            if not Customer.SeniorHechiceroAuthorized then
                Error('Customer %1 is not authorized to purchase %2 grade weapons. ' +
                      'Enable Senior Hechicero Authorization on the customer card.',
                      CustomerNo, CursedWeapon.CursedGrade);
    end;

    // ── ChangeWeaponStatus ─────────────────────────────────────────────
    // Cambia el estado y escribe en WeaponLifecycleEntry
    procedure ChangeWeaponStatus(WeaponNo: Code[20]; NewStatus: Enum "Weapon Status"; Reason: Text[150])
    var
        CursedWeapon: Record "Cursed Weapon";
        LifecycleEntry: Record "Weapon Lifecycle Entry";
        LastEntry: Record "Weapon Lifecycle Entry";
        NextEntryNo: Integer;
    begin
        if not CursedWeapon.Get(WeaponNo) then exit;

        // Calcular el siguiente EntryNo
        NextEntryNo := 1;
        if LastEntry.FindLast() then
            NextEntryNo := LastEntry."Entry No." + 1;

        // Insertar entrada en el libro de historial
        LifecycleEntry.Init();
        LifecycleEntry."Entry No." := NextEntryNo;
        LifecycleEntry."Weapon No." := WeaponNo;
        LifecycleEntry.EntryDate := CurrentDateTime();
        LifecycleEntry.OldStatus := CursedWeapon.WeaponStatus;
        LifecycleEntry.NewStatus := NewStatus;
        LifecycleEntry.Reason := Reason;
        LifecycleEntry.UserID := CopyStr(UserId(), 1, 50);
        LifecycleEntry.ThreatLevelAtEntry := CursedWeapon.ThreatLevel;
        LifecycleEntry.Insert(true);

        // Cambiar el estado en la tabla CursedWeapon
        CursedWeapon.WeaponStatus := NewStatus;
        CursedWeapon.Modify(true);
    end;

    // ── CreateCursedWeaponFromItem ─────────────────────────────────────
    // Crea el registro inicial en CursedWeapon desde un Item
    procedure CreateCursedWeaponFromItem(ItemNo: Code[20])
    var
        CursedWeapon: Record "Cursed Weapon";
        Item: Record Item;
    begin
        // Evitar duplicados
        if CursedWeapon.Get(ItemNo) then exit;
        if not Item.Get(ItemNo) then exit;

        CursedWeapon.Init();
        CursedWeapon."No." := ItemNo;
        CursedWeapon.ItemNo := ItemNo;
        CursedWeapon.Description := Item.Description;
        CursedWeapon.WeaponStatus := CursedWeapon.WeaponStatus::Dormant;
        CursedWeapon.Insert(true);

        // Calcular ThreatLevel inicial
        CalculateThreatLevel(ItemNo);
    end;

    // ── GetWeaponSummary ───────────────────────────────────────────────
    // Devuelve texto resumen para notificaciones y mensajes
    procedure GetWeaponSummary(WeaponNo: Code[20]): Text
    var
        CursedWeapon: Record "Cursed Weapon";
    begin
        if not CursedWeapon.Get(WeaponNo) then
            exit(WeaponNo);

        exit(StrSubstNo('[%1] %2 — Grade: %3 — Threat: %4',
            CursedWeapon."No.",
            CursedWeapon.Description,
            CursedWeapon.CursedGrade,
            CursedWeapon.ThreatLevel));
    end;
}
