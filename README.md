# Forja-Hechicera-S.-L.-Cloud

## Resumen del proyecto

Esta extensión AL para Business Central implementa un dominio de "Armas Malditas" dentro del módulo estándar.

El proyecto permite gestionar:
- armas malditas como registros propios en una tabla personalizada,
- técnicas malditas con multiplicadores de energía,
- el ciclo de vida completo de las armas, desde su creación hasta su venta,
- autorizaciones de clientes para comprar grados restringidos,
- el cálculo automático del nivel de amenaza y su seguimiento histórico.

## Estructura del repositorio

- `src/table/` — tablas de datos principales.
- `src/enum/` — enumeraciones usadas en tablas y lógica.
- `src/codeunit/` — lógica empresarial y reglas de negocio.
- `src/page/` — páginas listas, tarjetas, partes y API.
- `src/pageextension/` — extensiones de páginas estándar para integración con BC.
- `src/tableextension/` — campos adicionales en tablas estándar `Item` y `Customer`.
- `src/report/` — informes definidos como esqueleto.

## Objetos principales

### Tablas

- `Cursed Weapon` (tabla 50000): almacena las armas, su estado, grado, técnica, nivel de amenaza, fecha de forja y cliente comprador.
- `Cursed Technique` (tabla 50001): define técnicas malditas con multiplicador de energía y grado mínimo requerido.
- `Weapon Lifecycle Entry` (tabla 50002): registra cada cambio de estado de un arma para auditoría.

### Enumeraciones

- `Cursed Grade` (enum 50000): clasifica el grado maldito de cada arma.
- `Weapon Status` (enum 50001): define el ciclo de vida del arma (`Dormant`, `Active`, `Sealed`, `Destroyed`, `Sold`).
- `Cursed Technique Type` (enum 50002): define el tipo de técnica y su efecto en el cálculo de amenaza.

### Codeunits

- `Cursed Weapon Mgt` (codeunit 50000): gestiona el cálculo de amenaza, la validación de ventas, la creación de armas desde `Item` y el registro de cambios de estado.
- `Cursed Weapon Events` (codeunit 50001): escucha eventos estándar de Business Central y desencadena acciones automáticas sobre armas malditas.

## Flujo de negocio

1. Se marca un `Item` como arma maldita usando `IsCursedWeapon`.
2. Si el artículo se modifica, se crea el registro de `Cursed Weapon` automáticamente.
3. El cálculo de `ThreatLevel` se basa en el grado del arma y su técnica innata.
4. Antes de liberar un pedido de venta, se valida si el cliente está autorizado para comprar el grado del arma.
5. Al completar un ensamblaje o al registrar una factura, el estado del arma cambia y se guarda una entrada en el historial de ciclo de vida.

## Páginas y experiencia de usuario

- `Cursed Weapon List` y `Cursed Weapon Card`: gestión y visualización de armas malditas.
- `Weapon Lifecycle List` y `Weapon Lifecycle List Part`: seguimiento del historial de cambios de estado.
- `Cursed Techniques List` y `Cursed Techniques Card`: mantenimiento de las técnicas malditas.
- `Cursed Weapon API`: exposición de datos a través de OData.
- Extensiones de `Item Card`, `Item List`, `Sales Order` y `Customer Card`: integran el flujo de armas malditas con los procesos estándar.

## Notas técnicas importantes

- El código AL contiene comentarios explicativos añadidos para facilitar su comprensión.
- No se ha modificado la lógica funcional del proyecto; solo se documentó el código.
- `CODIGO_COMPLETO_PROYECTO.txt` recopila el código fuente actual del proyecto.

## Recomendaciones de uso

1. Abrir el proyecto en Visual Studio Code con la extensión AL instalada.
2. Verificar que `app.json` apunta a la versión correcta de Business Central.
3. Descargar símbolos y compilar la extensión antes de publicarla.
4. Probar el flujo de arma maldita con un `Item` y la creación/venta desde el entorno de BC.

## Archivos clave

- `app.json`
- `README.md`
- `src/codeunit/`
- `src/table/`
- `src/page/`
