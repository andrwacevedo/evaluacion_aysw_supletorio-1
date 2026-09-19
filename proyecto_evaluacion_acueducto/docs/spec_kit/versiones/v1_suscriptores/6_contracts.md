<!-- ------------------------------------------------------------------
     PLANTILLA · 6_contracts.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... QUE promete la API y que promete la pantalla
     SE ALIMENTA DE ..... 5_data_model · RF de esta version · POLITICA_DE_ERRORES
     ------------------------------------------------------------------ -->

# Contratos — Versión 1

## 1. La API se documenta sola

Se publica Swagger en `/swagger` en desarrollo. **Es un requisito, no una
comodidad**: el contrato tiene que poder leerse sin abrir el código.

## 2. El sobre de error

Remite a [`POLITICA_DE_ERRORES.md`](POLITICA_DE_ERRORES.md). No inventa
códigos aquí.

| Código | Cuándo | Quién lo produce |
|---|---|---|
| `400 PeticionInvalida` | JSON malformado o tipo incorrecto | ASP.NET Core |
| `404 NoEncontrado` | El `id` no existe | Servicio |
| `409 Conflicto` | `numero` ya existe | Servicio (traduce el `UNIQUE`) |
| `422 ReglaViolada` | Campo obligatorio vacío o `fk_tipo` inexistente | Servicio |
| `500 ErrorInterno` | Falla no controlada | ASP.NET Core |

## 3. Los recursos

### `suscriptor`

| Verbo | Ruta | Éxito | Error |
|---|---|---|---|
| `GET` | `/api/suscriptores?tipo={codigo}` | `200` | — |
| `GET` | `/api/suscriptores/{id}` | `200` | `404` |
| `POST` | `/api/suscriptores` | `201` | `409`, `422` |
| `PUT` | `/api/suscriptores/{id}` | `200` | `404`, `409`, `422` |
| `PATCH` | `/api/suscriptores/{id}` | `200` | `404`, `409`, `422` |
| `DELETE` | `/api/suscriptores/{id}` | `204` | `404` |

**Cuerpo de `POST` y `PUT`** (`SuscriptorCrear`):
\`\`\`json
{
  "numero": "AC-007",
  "nombre_titular": "…",
  "predio": "…",
  "telefono": "…",
  "fk_tipo": 1
}
\`\`\`
Todos obligatorios, salvo `telefono`.

**Cuerpo de `PATCH`** (`SuscriptorActualizar`): todos los campos
**anulables**. El servicio ignora los ausentes.

**Respuesta de `GET`** (`Suscriptor`):
\`\`\`json
{
  "id_suscriptor": 1,
  "numero": "AC-001",
  "nombre_titular": "Rosa Elena Munoz",
  "predio": "Lote 4, sector alto",
  "telefono": "3104455667",
  "fk_tipo": 1,
  "activo": true
}
\`\`\`

### `tipo-suscriptor`

| Verbo | Ruta | Éxito | Error |
|---|---|---|---|
| `GET` | `/api/tipos-suscriptor` | `200` | — |

Devuelve `[{ "id_tipo": 1, "codigo": "RES", "nombre": "Residencial", "se_factura": true }, …]`.

## 4. El recurso que se sale del patrón

`suscriptor` con `DELETE` **lógico**. Es el único recurso del contrato donde
el verbo no describe la operación completa: `DELETE` no borra. Se declara
explícitamente para que el consumidor no se sorprenda:

> `DELETE /api/suscriptores/{id}` marca `activo = 0`. La fila permanece. El
> listado de `GET /api/suscriptores` deja de incluirla; `GET
> /api/suscriptores/{id}` **sigue devolviéndola** con `activo: false`.

## 5. El contrato de las pantallas

| Ruta | Qué hace |
|---|---|
| `/suscriptores` | Lista los activos. Filtro por tipo en `?tipo=`. Marcador guardable |
| `/suscriptores/nuevo` | Formulario de creación. Muestra el `422` en pantalla |
| `/suscriptores/{id}` | Detalle y edición. Botón "Retirar" |

## 6. Lo que un consumidor debe saber antes de integrarse

- **Formato de fecha:** `fecha_toma` va como `YYYY-MM-DD`. `periodo` va como
  `AAAA-MM`.
- **El `numero` retirado no se libera.** Si se intenta reusar, `409`.
- **Los inactivos no aparecen en el listado**, pero sí en la consulta
  individual.
- **El `PATCH` con cuerpo vacío** `{}` responde `200` sin cambios. No es un
  error: no pidió cambiar nada.

---

## Criterio de cierre

- [x] Cada `RF-nn` de `2_spec` tiene su ruta aquí
- [x] El contraste entre `PUT` (reemplazo completo) y `PATCH` (parcial) está dicho
- [x] Los códigos de error citan la política
- [x] Cada pantalla tiene una dirección guardable como marcador