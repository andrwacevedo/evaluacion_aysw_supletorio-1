# La prueba de capas — Fase 4

**No prueba que el codigo funcione: prueba que las CAPAS SE RESPETEN.**

Escribala usted. Es un programa corto que **lee sus archivos como texto** y
falla si encuentra lo que no puede estar:

| En la carpeta | No puede aparecer |
|---|---|
| `Servicios/` | `IActionResult`, `ActionResult`, `NotFound`, `BadRequest`, `Ok`, `StatusCode`, `ControllerBase` |
| `Controllers/` | `SqlConnection`, `SqlCommand`, `SELECT`, `INSERT`, `UPDATE`, `DELETE` |

**Debe salir con codigo 1 si algo falla**, para que se pueda encadenar.

> **Y piense en el caso de cero archivos.** Si no ha escrito nada todavia,
> ¿deberia pasar o fallar? No hay una respuesta obvia — pero la pregunta 10d
> le va a pedir que justifique la que eligio.
