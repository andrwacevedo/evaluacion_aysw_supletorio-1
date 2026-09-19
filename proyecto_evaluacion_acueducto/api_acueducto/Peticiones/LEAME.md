# Peticiones — Fase 2

**Una clase por VERBO.** Son tres, y esto se revisa:

| Clase | Para | Los campos |
|---|---|---|
| `SuscriptorCrear` | `POST` | **Todos obligatorios** |
| `SuscriptorReemplazo` | `PUT` | **Todos obligatorios** |
| `SuscriptorActualizar` | `PATCH` | **Todos opcionales** (`string?`, `int?`) |

> **El error que mas se repite: usar la misma clase para `PUT` y `PATCH`.**
> Si la comparten, o el `PUT` acepta peticiones incompletas (y no debe), o el
> `PATCH` las rechaza (y no debe). **No hay forma de que los dos pasen.**
>
> Es la pregunta 7, y ahi se pide una peticion concreta que lo demuestre.
