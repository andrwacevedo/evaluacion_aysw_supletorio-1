<!-- ------------------------------------------------------------------
     PLANTILLA · 8_tasks.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... EN QUE ORDEN se construye, por fases
     SE ALIMENTA DE ..... 3_plan + 6_contracts, partidos en fases verificables
     ------------------------------------------------------------------ -->

# Tareas — Versión 1

> Cada fase termina en algo que se puede mirar correr.
> Y una fase no termina porque el código esté escrito: termina cuando se probó.

---

## Fase 0 · Partir del script entregado

Lo único dado es el esquema (`db/bdacueducto.sql`). No hay versiones
anteriores.

| # | Tarea | Hecho |
|---|---|---|
| 0.1 | Crear el repositorio privado e invitar a `ccastro2050` | ☐ |
| 0.2 | Copiar `db/bdacueducto.sql` y el esqueleto de `docker-compose.yml` | ☐ |
| 0.3 | Levantar el servicio `bd` y cargar el script | ☐ |
| 0.4 | Primer commit y `push` comprobado en el navegador | ☐ |

**Comprobación de la fase:** las tres tablas existen con 3 + 6 + 8 filas.
Se cuentan con `SELECT COUNT(*)` desde `sqlcmd`.

---

## Fase spec kit · Los ocho documentos, antes del código

| # | Tarea | Archivo |
|---|---|---|
| S.1 | Constitución | `1_constitution.md` |
| S.2 | Especificación | `2_spec.md` |
| S.3 | Plan y compuerta 2 | `3_plan.md` |
| S.4 | Decisiones | `4_research.md` |
| S.5 | Modelo de datos | `5_data_model.md` |
| S.6 | Contratos | `6_contracts.md` |
| S.7 | Arranque | `7_quickstart.md` |
| S.8 | Tareas | `8_tasks.md` |
| S.9 | Satélites: RF, RNF, política de errores, arquitectura, datos de prueba | varios |

**Comprobación de la fase:** los commits del spec kit son **anteriores** al
primer commit que toca un `.cs`. Se ve con `git log --oneline --reverse`.

---

## Fase 1 · Los modelos

| # | Tarea | Archivo |
|---|---|---|
| 1.1 | `Suscriptor` (lectura) | `api_acueducto/Modelos/Suscriptor.cs` |
| 1.2 | `TipoSuscriptor` | `api_acueducto/Modelos/TipoSuscriptor.cs` |
| 1.3 | `Lectura` (declarada, no usada) | `api_acueducto/Modelos/Lectura.cs` |

**Comprobación de la fase:** `dotnet build` compila sin errores.

---

## Fase 2 · Las peticiones por verbo y la excepción

| # | Tarea | Archivo |
|---|---|---|
| 2.1 | `SuscriptorCrear` (todos obligatorios salvo `telefono`) | `Peticiones/SuscriptorCrear.cs` |
| 2.2 | `SuscriptorActualizar` (todos anulables) | `Peticiones/SuscriptorActualizar.cs` |
| 2.3 | `ReglaVioladaExcepcion` | `Excepciones/ReglaVioladaExcepcion.cs` |
| 2.4 | `NoEncontradoExcepcion` | `Excepciones/NoEncontradoExcepcion.cs` |

**Comprobación de la fase:** compila, y `SuscriptorCrear` y
`SuscriptorActualizar` son **dos clases distintas** con campos distintos.

---

## Fase 3 · Interfaces y repositorio SQL Server

| # | Tarea | Archivo |
|---|---|---|
| 3.1 | `IRepositorioSuscriptor` | `Repositorios/IRepositorioSuscriptor.cs` |
| 3.2 | `RepositorioSuscriptorSqlServer` | `Repositorios/RepositorioSuscriptorSqlServer.cs` |
| 3.3 | `IRepositorioTipoSuscriptor` y su implementación | `Repositorios/` |

**Comprobación de la fase:** un `dotnet run` de prueba que llame al
repositorio devuelve las filas reales. **Si devuelve `500`, revisar los
`using`** — es el error típico de la fase.

---

## Fase 4 · Servicios y prueba de capas

| # | Tarea | Archivo |
|---|---|---|
| 4.1 | `IServicioSuscriptor` | `Servicios/IServicioSuscriptor.cs` |
| 4.2 | `ServicioSuscriptor` (sin HTTP) | `Servicios/ServicioSuscriptor.cs` |
| 4.3 | Prueba de capas | `Pruebas/CapasTest.cs` |

**Comprobación de la fase:** la prueba de capas pasa: ningún archivo bajo
`Servicios/` contiene `IActionResult`, `Http`, `StatusCodes` ni códigos
literales.

---

## Fase 5 · Controladores y `Program.cs`

| # | Tarea | Archivo |
|---|---|---|
| 5.1 | `SuscriptoresController` con los 6 endpoints | `Controladores/SuscriptoresController.cs` |
| 5.2 | `TiposSuscriptorController` | `Controladores/TiposSuscriptorController.cs` |
| 5.3 | `Program.cs` con inyección y CORS | `Program.cs` |
| 5.4 | Manejo del `409` por `UNIQUE` | `Program.cs` o filtro |

**Comprobación de la fase:** los siete endpoints responden. En particular,
el `PUT` devuelve `422` con cuerpo parcial y el `PATCH` devuelve `200`.

---

## Fase 6 · El front

| # | Tarea | Archivo |
|---|---|---|
| 6.1 | Listado con filtro | `front/suscriptores.html` (o equivalente) |
| 6.2 | Formulario de creación con `422` en pantalla | `front/nuevo.html` |
| 6.3 | Edición con `PATCH` | `front/editar.html` |
| 6.4 | Manejo de "API apagada" | `front/app.js` |

**Comprobación de la fase:** la pantalla lista y crea. Apagar la API y
recargar: sigue en pie con el mensaje de error.

---

## Fase 7 · Docker: un solo comando

| # | Tarea | Archivo |
|---|---|---|
| 7.1 | Servicio cargador de `db/bdacueducto.sql` | `docker-compose.yml` |
| 7.2 | Servicio de la API | `docker-compose.yml` |
| 7.3 | Servicio del front | `docker-compose.yml` |
| 7.4 | Cadena de conexión por variable | `docker-compose.yml` + `.env.example` |

**Comprobación de la fase:** `docker compose down -v && docker compose up -d
--build` deja los tres servicios en pie desde cero.

---

## Fase 8 · Cierre

| # | Tarea | Archivo |
|---|---|---|
| 8.1 | Firmar `9_checklist.md` | `9_checklist.md` |
| 8.2 | Diligenciar `PROMPTS.md` | `PROMPTS.md` |
| 8.3 | Diligenciar `RESPUESTAS.md` | `RESPUESTAS.md` |
| 8.4 | Llenar `2_spec §7` y `8_tasks` "Lo que enseñó" | varios |

**Comprobación de la fase:** el repositorio tiene mínimo nueve commits, uno
por fase, con `Fase N —` al principio del mensaje.

---

## Lo que esta versión enseñó sobre el orden

*(Se llena AL CERRAR. Vacío porque aún no cerró.)*

---

## Criterio de cierre

- [x] Cada fase tiene su comprobación, y no es "revisar que esté"
- [x] Ninguna fase produce solo archivos
- [x] Hay un commit por fase, con lo que se probó en cada una