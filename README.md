# Forja-Hechicera-S.-L.-Cloud

## Descripción general

Este repositorio contiene una extensión AL para Business Central llamada `tfg-proyecto` desarrollada con el publisher `Default Publisher` y versión `1.0.0.0`.

El proyecto introduce un dominio de "Armas Malditas" con:
- Tablas personalizadas para `Cursed Weapon`, `Cursed Technique` y `Weapon Lifecycle Entry`
- Enumeraciones de grado, estado y tipo de técnica
- Codeunits para gestión de cálculo de amenaza, cambios de estado y suscriptores a eventos estándar de BC
- Páginas de lista, tarjeta y API para exponer los datos
- Extensiones de tabla y página sobre `Item`, `Customer`, `Sales Order` y `Item Card`
- Dos reportes esqueleto sin dataset implementado

El README a continuación documenta TODO el proyecto, con objetos, campos, relaciones, triggers, código y flujos de datos.

---

## app.json

Archivo: `app.json`

Contenido relevante:
- id: `d4907717-652d-4163-bbc7-7992674763b0`
- name: `tfg-proyecto`
- publisher: `Default Publisher`
- version: `1.0.0.0`
- platform: `1.0.0.0`
- application: `23.0.0.0`
- runtime: `12.2`
- features: [`NoImplicitWith`]
- idRanges: `50000..59999`
- dependencies: []
- resourceExposurePolicy: allowDebugging=true, allowDownloadingSource=true, includeSourceInSymbolFile=true

---

## Estructura de archivos y objetos AL

### Tablas

#### `src/table/Tab50000.CursedWeapon.al`

Objeto: `table 50000 "Cursed Weapon"`

Campos:
- `1; "No."; Code[20]` Caption = 'No.'; TableRelation = Item
- `2; ItemNo; Code[20]` Caption = 'Item No.'; TableRelation = Item
- `3; Description; Text[100]` Caption = 'Description'
- `4; CursedGrade; Enum "Cursed Grade"` Caption = 'Cursed Grade'
- `5; WeaponStatus; Enum "Weapon Status"` Caption = 'Weapon Status'; Editable = false
- `6; InnateTeq; Enum "Cursed Technique Type"` Caption = 'Innate Technique'
- `7; ForgerName; Text[50]` Caption = 'Forger Name'
- `8; BindingVows; Text[250]` Caption = 'Binding Vows'
- `9; ThreatLevel; Decimal` Caption = 'Threat Level'; Editable = false; DecimalPlaces = 2 : 2
- `10; ForgeDate; Date` Caption = 'Forge Date'
- `11; SoldToCustomerNo; Code[20]` Caption = 'Sold-to Customer No.'; TableRelation = Customer; Editable = false
- `12; "No. Series"; Code[20]` Caption = 'No. Series'; TableRelation = "No. Series"
- `13; Notes; Text[500]` Caption = 'Notes'

Keys:
- `PK; "No."` Clustered = true
- `Grade; CursedGrade`
- `Status; WeaponStatus`

Triggers:
- `OnInsert()` (vacío)
- `OnModify()` (vacío)
- `OnDelete()` (vacío)
- `OnRename()` (vacío)

Notas:
- El campo `WeaponStatus` está marcado como no editable porque se actualiza desde la lógica del codeunit `Cursed Weapon Mgt` y eventos.
- El campo `SoldToCustomerNo` guarda el cliente final cuando un arma se vende.

---

#### `src/table/Tab50001.CursedTechnique.al`

Objeto: `table 50001 "Cursed Technique"`

Campos:
- `1; Code; Code[10]` Caption = 'Code'
- `2; Name; Text[50]` Caption = 'Name'
- `3; Description; Text[250]` Caption = 'Description'
- `4; EnergyMultiplier; Decimal` Caption = 'Energy Multiplier'; DecimalPlaces = 2 : 2; MinValue = 0.1
- `5; MinGrade; Enum "Cursed Grade"` Caption = 'Min. Grade Required'
- `6; IsActive; Boolean` Caption = 'Is Active'; InitValue = true

Keys:
- `PK; Code` Clustered = true

Triggers:
- `OnInsert()`, `OnModify()`, `OnDelete()`, `OnRename()` están definidos vacíos.

Notas:
- Esta tabla alberga técnicas malditas y su multiplicador de energía.

---

#### `src/table/Tab50002.WeaponLifecycleEntry.al`

Objeto: `table 50002 "Weapon Lifecycle Entry"`

Campos:
- `1; "Entry No."; Integer` Caption = 'Entry No.'; AutoIncrement = true
- `2; "Weapon No."; Code[20]` Caption = 'Weapon No.'; TableRelation = "Cursed Weapon"
- `3; EntryDate; DateTime` Caption = 'Entry Date'
- `4; OldStatus; Enum "Weapon Status"` Caption = 'Old Status'
- `5; NewStatus; Enum "Weapon Status"` Caption = 'New Status'
- `6; Reason; Text[150]` Caption = 'Reason'
- `7; UserID; Code[50]` Caption = 'User ID'
- `8; ThreatLevelAtEntry; Decimal` Caption = 'Threat Level At Entry'; DecimalPlaces = 2 : 2; Editable = false

Keys:
- `PK; "Entry No."` Clustered = true
- `Weapon; "Weapon No." , EntryDate`

Triggers:
- `OnInsert()`, `OnModify()`, `OnDelete()`, `OnRename()` vacíos.

Notas:
- Registra cada cambio de estado de un arma maldita, conservando estado previo, nuevo estado, motivo y nivel de amenaza en ese momento.

---

### Enumeraciones

#### `src/enum/Enum50000.CursedGrade.al`

Objeto: `enum 50000 "Cursed Grade"` Extensible = true

Valores:
- `0; "Special"` Caption = 'Special Grade'
- `1; "SemiGrade1"` Caption = 'Semi-Grade 1'
- `2; "SemiGrade2"` Caption = 'Semi-Grade 2'
- `3; "Grade1"` Caption = 'Grade 1'
- `4; "Grade2"` Caption = 'Grade 2'
- `5; "Grade4"` Caption = 'Grade 4'

Notas:
- Define la clasificación de la arma.

---

#### `src/enum/Enum50001.WeaponStatus.al`

Objeto: `enum 50001 "Weapon Status"` Extensible = true

Valores:
- `0; "Dormant"` Caption = 'Dormant' (estado inicial al crear)
- `1; "Active"` Caption = 'Active' (tras completar un Assembly Order)
- `2; "Sealed"` Caption = 'Sealed' (sellada temporalmente)
- `3; "Destroyed"` Caption = 'Destroyed' (destruida)
- `4; "Sold"` Caption = 'Sold' (al contabilizar albarán)

Notas:
- El estado rige el ciclo de vida del arma y se almacena en `Cursed Weapon`.

---

#### `src/enum/Enum50002.CursedTechniqueType.al`

Objeto: `enum 50002 "Cursed Technique Type"` Extensible = true

Valores:
- `0; "None"` Caption = 'None' // x1.0
- `1; "Infinity"` Caption = 'Infinity' // x3.0 - Gojo
- `2; "NegativeCalm"` Caption = 'Negative Calm' // x2.0 - Nanami
- `3; "Tetragrammaton"` Caption = 'Tetragrammaton' // x2.5 - Maki
- `4; "Resonance"` Caption = 'Resonance' // x1.8 - Nobara
- `5; "Unknown"` Caption = 'Unknown' // x1.5

Notas:
- Se usa para calcular la amenaza según técnica innata de la arma.

---

## Codeunits

### `src/codeunit/Cod50000.CursedWeaponMgt.al`

Objeto: `codeunit 50000 "Cursed Weapon Mgt"`

Procedimientos públicos:

1. `procedure CalculateThreatLevel(WeaponNo: Code[20])`
   - Obtiene el registro `Cursed Weapon` por `WeaponNo`.
   - Calcula `GradeBase` según `CursedGrade`:
     - `Special` = 10
     - `SemiGrade1` = 8
     - `SemiGrade2` = 6
     - `Grade1` = 4
     - `Grade2` = 2
     - `Grade4` = 1
   - Determina `Multiplier` por `InnateTeq`:
     - `Infinity` => 3.0
     - `NegativeCalm` => 2.0
     - `Tetragrammaton` => 2.5
     - `Resonance` => 1.8
     - `Unknown` => 1.5
     - default => 1.0
   - Calcula `ThreatResult := GradeBase * Multiplier`.
   - Si `BindingVows <> ''`, aplica bonificación de +20% multiplicando por `1.2`.
   - Asigna `ThreatLevel := ThreatResult` y modifica el registro.

2. `procedure ValidateSaleAuthorization(ItemNo: Code[20]; CustomerNo: Code[20])`
   - Obtiene `Cursed Weapon` y `Customer`.
   - Si el arma es de grado `Special` o `Grade1`, requiere que `Customer.SeniorHechiceroAuthorized` sea verdadero.
   - Si no está autorizado, lanza error:
     `Customer %1 is not authorized to purchase %2 grade weapons. Enable Senior Hechicero Authorization on the customer card.`

3. `procedure ChangeWeaponStatus(WeaponNo: Code[20]; NewStatus: Enum "Weapon Status"; Reason: Text[150])`
   - Obtiene `Cursed Weapon`.
   - Calcula `NextEntryNo` con el último registro de `Weapon Lifecycle Entry`.
   - Inserta una nueva entrada de historial con:
     - `Weapon No.`
     - `EntryDate := CurrentDateTime()`
     - `OldStatus`, `NewStatus`
     - `Reason`
     - `UserID := CopyStr(UserId(), 1, 50)`
     - `ThreatLevelAtEntry := CursedWeapon.ThreatLevel`
   - Cambia `CursedWeapon.WeaponStatus := NewStatus` y modifica el registro.

4. `procedure CreateCursedWeaponFromItem(ItemNo: Code[20])`
   - Evita duplicados si `CursedWeapon.Get(ItemNo)` ya existe.
   - Obtiene `Item` por `ItemNo`.
   - Inicializa `Cursed Weapon` con:
     - `No. = ItemNo`
     - `ItemNo = ItemNo`
     - `Description = Item.Description`
     - `WeaponStatus = Dormant`
   - Inserta registro y llama `CalculateThreatLevel(ItemNo)`.

5. `procedure GetWeaponSummary(WeaponNo: Code[20]): Text`
   - Devuelve resumen de texto:
     `[%1] %2 — Grade: %3 — Threat: %4`
   - Si no existe el registro, retorna `WeaponNo`.

Notas:
- Este codeunit centraliza toda la lógica de negocio de amenaza y cambios de estado.
- Usa referencias a `Cursed Weapon`, `Cursed Technique`, `Customer` y `Weapon Lifecycle Entry`.

---

### `src/codeunit/Cod50001.CursedWeaponEvents.al`

Objeto: `codeunit 50001 "Cursed Weapon Events"`

Suscriptores a eventos:

1. `OnAfterModifyItem` (Table Item, OnAfterModifyEvent)
   - Si un artículo cambia a `Rec.IsCursedWeapon = true` desde `xRec.IsCursedWeapon = false`, llama a:
     `Mgt.CreateCursedWeaponFromItem(Rec."No.")`
   - Nota: asume que existe el campo `IsCursedWeapon` en `Item` gracias a la extensión de tabla.

2. `OnBeforeReleaseSalesDoc` (Codeunit "Release Sales Document", OnBeforeReleaseSalesDoc)
   - Recorre líneas de venta del documento.
   - Para cada línea de tipo `Item` que corresponda a un `Cursed Weapon`, llama:
     `Mgt.ValidateSaleAuthorization(SalesLine."No.", SalesHeader."Sell-to Customer No.")`
   - Esto impide liberar ventas de armas malditas sin autorización adecuada.

3. `OnAfterPostAssemblyOrder` (Codeunit "Assembly-Post", OnAfterPost)
   - Si el item ensamblado es un `Cursed Weapon`:
     - `Mgt.ChangeWeaponStatus(..., Active, 'Assembly Order completed')`
     - `Mgt.CalculateThreatLevel(...)`
     - Actualiza `ForgeDate := Today`
   - Aquí el arma pasa de `Dormant` a `Active`.

4. `OnAfterPostSalesShipLine` (Codeunit "Sales-Post", OnAfterPostSalesDoc)
   - Tras contabilizar venta, para cada línea de item que sea arma maldita:
     - Cambia estado a `Sold`
     - Escribe motivo `Sold via Sales Order %1`
     - Actualiza `SoldToCustomerNo` con el cliente del pedido.

Notas:
- Este codeunit conecta la lógica de armas malditas con el flujo estándar de BC: Item, Release Sales Document, Assembly Post y Sales Post.
- Los nombres de eventos y objetos dependientes son exactos de BC estándar.

---

## Páginas

### `src/page/Pag50000.CursedWeaponList.al`

Objeto: `page 50000 "Cursed Weapon List"`

Tipo: `List`
Fuente: `Cursed Weapon`
CardPageId: `Cursed Weapon Card`
Editable: false
UsageCategory = Lists
ApplicationArea = All

Layout:
- Repeater `WeaponList`
  - Campos mostrados: `No.`, `Description`, `CursedGrade`, `WeaponStatus`, `ThreatLevel`, `ForgerName`, `InnateTeq`
  - `WeaponStatus` usa `StyleExpr = StatusStyle`

Acciones:
- `CalculateAll`
  - Caption = 'Recalculate All Threat Levels'
  - Imagen = Calculate
  - Recorre todos los registros `Cursed Weapon` y ejecuta `Mgt.CalculateThreatLevel(...)`
  - Actualiza la página con `CurrPage.Update(false)`

Triggers:
- `OnAfterGetRecord()` asigna `StatusStyle` según `Rec.WeaponStatus`:
  - `Active` => Favorable
  - `Sold` => Strong
  - `Sealed` => Attention
  - `Destroyed` => Unfavorable
  - else => StandardAccent

---

### `src/page/Pag50001.CursedWeaponCard.al`

Objeto: `page 50001 "Cursed Weapon Card"`

Tipo: `Card`
Fuente: `Cursed Weapon`
Caption = 'Cursed Weapon Card'
UsageCategory = None

Layout:
- Grupo `General` con campos: `No.`, `Description`, `CursedGrade`, `WeaponStatus`, `InnateTeq`, `ThreatLevel`
- Grupo `ForgeDetails` con campos: `ForgerName`, `ForgeDate`, `BindingVows`
- Grupo `SaleInfo` con campo: `SoldToCustomerNo`
- Grupo `Notes` con `NotesField` multi-línea
- FactBox `LifecyclePart` de la página `Weapon Lifecycle List Part`, enlazada por `"Weapon No." = field("No.")`

Acciones:
- `CalculateThreat`
  - recalcula nivel de amenaza con `Mgt.CalculateThreatLevel(Rec."No.")`
  - recarga el registro y actualiza página
- `ChangeStatus`
  - cambia estado con `Mgt.ChangeWeaponStatus(Rec."No.", NewStatus, Reason)`
  - actualmente el diálogo está simplificado y usa `Reason := 'Manual status change'`

Triggers:
- `OnAfterGetRecord()` asigna `StatusStyle` igual que en la lista.
- `OnNewRecord(BelowxRec: Boolean)`
  - Si `Rec."No." = ''`, llama `NoSeriesMgt.InitSeries('CW', '', Today, Rec."No.", Rec."No. Series")`
  - Inicializa `WeaponStatus := Dormant`

Notas:
- Usa `NoSeriesManagement` para generar números automáticos con prefijo `CW`.
- El campo `WeaponStatus` se presenta en estilo visual.

---

### `src/page/Pag50002.WeaponLifecycleList.al`

Objeto: `page 50002 "Weapon Lifecycle List"`

Tipo: `List`
Fuente: `Weapon Lifecycle Entry`
Editable = false
InsertAllowed = false
ModifyAllowed = false
DeleteAllowed = false
UsageCategory = Lists
ApplicationArea = All

Layout muestra campos:
- `Entry No.`, `Weapon No.`, `EntryDate`, `OldStatus`, `NewStatus`, `Reason`, `UserID`, `ThreatLevelAtEntry`

Notas:
- Página de historial de cambios de estado.

---

### `src/page/Pag50003.CursedTechniquesList.al`

Objeto: `page 50003 "Cursed Techniques List"`

Tipo: `List`
Fuente: `Cursed Technique`
UsageCategory = Lists
ApplicationArea = All

Layout muestra:
- `Code`, `Name`, `EnergyMultiplier`, `MinGrade`, `IsActive`

Notas:
- Lista las técnicas definidas en la tabla de técnicas malditas.

---

### `src/page/Pag50004.CursedTechniquesCard.al`

Objeto: `page 50004 "Cursed Techniques Card"`

Tipo: `Card`
Fuente: `Cursed Technique`
UsageCategory = None

Layout:
- Grupo `General`: `Code`, `Name`, `EnergyMultiplier`, `MinGrade`, `IsActive`
- Grupo `DescGroup`: `Description` multi-línea

Notas:
- Página de edición y visualización de técnicas.

---

### `src/page/Pag50005.CursedWeaponAPI.al`

Objeto: `page 50005 "Cursed Weapon API"`

Tipo: `API`
APIGroup = 'cursedWeapons'
APIPublisher = 'forjaHechicera'
APIVersion = 'v1.0'
EntityName = 'cursedWeapon'
EntitySetName = 'cursedWeapons'
SourceTable = "Cursed Weapon"
Editable = false
ODataKeyFields = "No."

Layout expone los campos API:
- `no`, `description`, `cursedGrade`, `weaponStatus`, `threatLevel`, `forgerName`, `innateTeq`, `forgeDate`

Notas:
- Exposición OData/JSON para accesos externos a armas malditas.

---

### `src/page/Pag50006.WeaponLifecycleListPart.al`

Objeto: `page 50006 "Weapon Lifecycle List Part"`

Tipo: `ListPart`
Fuente: `Weapon Lifecycle Entry`
Editable = false
InsertAllowed = false
ModifyAllowed = false
DeleteAllowed = false

Layout muestra:
- `EntryDate`, `OldStatus`, `NewStatus`, `Reason`, `UserID`

Notas:
- Parte de página usada como factbox en `Cursed Weapon Card`.

---

## Extensiones de página

### `src/pageextension/Pag-Ext50000.ItemCardExt.al`

Objeto: `pageextension 50000 "Item Card Ext" extends "Item Card"`

Añade en la sección `Item` del card de Item:
- Grupo `Cursed Data`
  - Campo `IsCursedWeapon` (Boolean)
  - Campo `CursedGrade` (Enum "Cursed Grade")
  - Campo `QuickThreatLevel` (FlowField) `lookup("Cursed Weapon".ThreatLevel where(ItemNo = field("No.")))`

Acción añadida:
- `ViewCursedWeapon`
  - Visible cuando `Rec.IsCursedWeapon`
  - Obtiene registro `Cursed Weapon` y abre `Cursed Weapon Card`

Notas:
- Esta extensión integra la tabla de Item con el dominio de armas malditas y permite navegar directamente.

---

### `src/pageextension/Pag-Ext50001.ItemListExt.al`

Objeto: `pageextension 50001 "Item List Ext" extends "Item List"`

Modifica el listado de artículos para mostrar:
- `IsCursedWeapon` con caption `Cursed`
- `CursedGrade` con caption `Grade`

Añade una vista filtrada:
- `CursedWeaponsFilter` con `Filters = where(IsCursedWeapon = const(true))`

Notas:
- Permite ver todos los ítems marcados como armas malditas desde la lista estándar de artículos.

---

### `src/pageextension/Pag-Ext50002.SalesOrderExt.al`

Objeto: `pageextension 50002 "Sales Order Ext" extends "Sales Order"`

Añade part al final de FactBoxes:
- `CursedWeaponInfo` de la página `Weapon Lifecycle List Part`
- SubPageLink: `"Weapon No." = field("No.")`

Notas:
- Intenta mostrar historial de ciclo de vida de armas relacionadas, aunque la relación exacta de campo depende de contexto de sales order.

---

### `src/pageextension/Pag-Ext50003.CustomerCardExt.al`

Objeto: `pageextension 50003 "Customer Card Ext" extends "Customer Card"`

Añade grupo `Cursed Authorization` en la pestaña `General` de cliente:
- `SeniorHechiceroAuthorized` Boolean
- `MaxCursedGrade` Enum "Cursed Grade"

Notas:
- Soporta autorización para venta de armas de grado `Special` y `Grade1`.

---

## Extensiones de tabla

### `src/tableextension/Tab-Ext50000.ItemTableExt.al`

Objeto: `tableextension 50000 "Item Table Ext" extends Item`

Campos añadidos:
- `50100; IsCursedWeapon; Boolean` Caption = 'Is Cursed Weapon'
- `50101; CursedGrade; Enum "Cursed Grade"` Caption = 'Cursed Grade'
- `50102; QuickThreatLevel; Decimal` Caption = 'Threat Level'; FieldClass = FlowField; CalcFormula = lookup("Cursed Weapon".ThreatLevel where(ItemNo = field("No."))); Editable = false

Notas:
- Permite usar artíulos estándar como fuente para crear armas malditas.
- `QuickThreatLevel` expone el nivel de amenaza de la arma maldita vinculada.

---

### `src/tableextension/Tab-Ext50001.CustomerTableExt.al`

Objeto: `tableextension 50001 "Customer Table Ext" extends Customer`

Campos añadidos:
- `50100; SeniorHechiceroAuthorized; Boolean` Caption = 'Senior Hechicero Authorized'
- `50101; MaxCursedGrade; Enum "Cursed Grade"` Caption = 'Max Cursed Grade'

Notas:
- Define atributos de cliente para permitir o restringir ventas de armas malditas.

---

## Reportes

### `src/report/Rep50000.CursedWeaponInventory.al`

Contenido:
- Archivo contiene únicamente un template comentado de reporte.
- No hay dataset, requestpage ni rendering implementados.

Notas:
- Reporte pendiente de implementación real.

---

### `src/report/Rep50001.ThreatAssessmentSummary.al`

Objeto: `report 50001 ThreatAssessmentSummary`

Contenido:
- Uso de `ReportsAndAnalysis`
- `ApplicationArea = All`
- Dataset comentado
- RequestPage con `AboutTitle` y `AboutText` de ejemplo
- Variables definidas: `myInt: Integer`

Notas:
- Reporte también es esqueleto: sin columnas, sin layout funcional.

---

## Flujo completo de negocio

1. Un `Item` estándar puede marcarse como arma maldita mediante `Item.IsCursedWeapon`.
2. Si un artículo se modifica y se activa `IsCursedWeapon`, el evento `OnAfterModifyItem` crea un registro `Cursed Weapon` a partir del `Item`.
3. La `Cursed Weapon` usa datos del artículo y se inicializa en estado `Dormant`.
4. Al completar un `Assembly Order` estándar, el evento `OnAfterPostAssemblyOrder` cambia el estado del arma a `Active`, recalcula su amenaza y fija `ForgeDate`.
5. Antes de liberar un pedido de venta, `OnBeforeReleaseSalesDoc` revisa las líneas de venta y evita la venta de armas malditas a clientes no autorizados.
6. Tras postear la factura/embarque de venta, `OnAfterPostSalesShipLine` marca el arma como `Sold`, guarda el cliente comprador y crea un registro de ciclo de vida.
7. Cada cambio de estado se registra en `Weapon Lifecycle Entry` con `OldStatus`, `NewStatus`, `Reason`, `UserID`, `EntryDate` y `ThreatLevelAtEntry`.
8. La página `Cursed Weapon Card` muestra un factbox con el historial de ciclo de vida.
9. El API `Cursed Weapon API` expone la información clave de `Cursed Weapon` para consumo externo.

---

## Relaciones y dependencias de datos

Relaciones clave:
- `Cursed Weapon."No."` y `Item.No.`
- `Cursed Weapon.ItemNo` → `Item.No.`
- `Cursed Weapon.SoldToCustomerNo` → `Customer.No.`
- `Cursed Weapon.InnateTeq` → Enum `Cursed Technique Type`
- `Cursed Weapon.CursedGrade` → Enum `Cursed Grade`
- `Weapon Lifecycle Entry."Weapon No."` → `Cursed Weapon."No."`
- `Item.QuickThreatLevel` flujo de cálculo lookup a `Cursed Weapon.ThreatLevel` donde `ItemNo = Item."No."`

Dependencias funcionales:
- `Cod50001.CursedWeaponEvents` depende de eventos estándar de `Release Sales Document`, `Assembly-Post`, `Sales-Post` y la tabla `Item` modificada.
- `Pag-Ext50000.ItemCardExt.al` depende de la extensión de `Item Table Ext` para los nuevos campos.

---

## Archivo completo del proyecto

Listado de todos los archivos `.al` y su propósito:

- `src/table/Tab50000.CursedWeapon.al`: tabla principal de armas malditas.
- `src/table/Tab50001.CursedTechnique.al`: catálogo de técnicas y multiplicadores.
- `src/table/Tab50002.WeaponLifecycleEntry.al`: historial de cambios de estado.
- `src/enum/Enum50000.CursedGrade.al`: enum de niveles de grado.
- `src/enum/Enum50001.WeaponStatus.al`: enum de estados de armas.
- `src/enum/Enum50002.CursedTechniqueType.al`: enum de tipos de técnicas.
- `src/codeunit/Cod50000.CursedWeaponMgt.al`: lógica principal de negocio.
- `src/codeunit/Cod50001.CursedWeaponEvents.al`: eventos integradores con BC estándar.
- `src/page/Pag50000.CursedWeaponList.al`: lista de armas.
- `src/page/Pag50001.CursedWeaponCard.al`: tarjeta de arma.
- `src/page/Pag50002.WeaponLifecycleList.al`: listado de historial de vida.
- `src/page/Pag50003.CursedTechniquesList.al`: lista de técnicas.
- `src/page/Pag50004.CursedTechniquesCard.al`: tarjeta de técnica.
- `src/page/Pag50005.CursedWeaponAPI.al`: API OData/JSON.
- `src/page/Pag50006.WeaponLifecycleListPart.al`: factbox de historial.
- `src/pageextension/Pag-Ext50000.ItemCardExt.al`: extiende item card con datos malditos.
- `src/pageextension/Pag-Ext50001.ItemListExt.al`: extiende lista de items con filtros y columnas.
- `src/pageextension/Pag-Ext50002.SalesOrderExt.al`: extiende sales order con parte de historial.
- `src/pageextension/Pag-Ext50003.CustomerCardExt.al`: extiende customer card con autorización.
- `src/tableextension/Tab-Ext50000.ItemTableExt.al`: añade campos de arma maldita a Item.
- `src/tableextension/Tab-Ext50001.CustomerTableExt.al`: añade autorización al cliente.
- `src/report/Rep50000.CursedWeaponInventory.al`: plantilla de reporte no implementada.
- `src/report/Rep50001.ThreatAssessmentSummary.al`: plantilla de reporte no implementada.

---

## Uso para Claude

Esta documentación está construida para ser copiada completa y enviada a Claude.
Incluye:
- metadata de `app.json`
- lista exhaustiva de archivos y objetos AL
- definición completa de tablas, campos y claves
- enumeraciones con valores exactos
- procedimientos y lógica de negocio en codeunits
- suscriptores de eventos y flujo de integración con BC
- diseño de páginas y extensiones
- estado de implementación de reportes
- relaciones de datos y dependencias

Si necesitas aún más granularidad, puedo generar un documento adicional que contenga cada archivo AL íntegro en formato de texto plano.
