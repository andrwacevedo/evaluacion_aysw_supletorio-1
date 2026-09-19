<!-- ------------------------------------------------------------------
     PLANTILLA · 5_data_model.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... QUE datos toca esta version y que defiende la base
     SE ALIMENTA DE ..... el diseno de BD, recortado a esta version · REGLAS_DE_NEGOCIO
     ------------------------------------------------------------------ -->
# Modelo de datos — Versión 1

> Las tablas que **esta versión** toca. No el modelo completo.

## 1. Cuáles son, y por qué son estas

| Tabla | Por qué entra |
|---|---|
| `suscriptor` | Es el recurso del CRUD de la versión |
| `tipo_suscriptor` | Se lee para poblar el combo y para validar `fk_tipo` |
| `lectura` | **No se toca** en esta versión. Se lista para dejar constancia de que existe |

Criterio: **las que el CRUD de `suscriptor` necesita leer o escribir, más la
que el front necesita para el combo.**

## 2. En qué se parecen

`suscriptor` y `tipo_suscriptor` comparten la forma de catálogo: PK
`IDENTITY`, una `UNIQUE` de negocio (`numero`, `codigo`) y un `BIT` de
estado (`activo`, `se_factura`). No son iguales: `activo` en `suscriptor` es
el borrado lógico; `se_factura` en `tipo_suscriptor` es una regla del
dominio.

## 3. La que NO comparte la forma

`lectura`. Tiene clave compuesta de negocio —`UNIQUE (fk_suscriptor,
periodo)`— y un `CHECK (valor >= 0)`. Su llave natural no es un `VARCHAR`
corto, es un par. **No se toca en esta versión**, pero se declara para que
la versión 2 no descubra a mitad que el modelo de `suscriptor` no se
extiende solo.

## 4. Lo que la base defiende, y la API deja pasar a propósito

| Regla | La defiende | Y la API… |
|---|---|---|
| `numero` único | `UNIQUE uq_suscriptor_num` | La traduce a `409` |
| `nombre_titular` obligatorio | `NOT NULL` | La valida antes y responde `422` |
| `predio` obligatorio | `NOT NULL` | La valida antes y responde `422` |
| `fk_tipo` válido | `FOREIGN KEY` | La valida antes; si no existe, `422` |
| `activo` por defecto | `DEFAULT 1` | No lo manda el usuario; el servicio lo fija |
| `telefono` anulable | `NULL` permitido | Lo acepta ausente sin `422` |
| `tipo_suscriptor.codigo` único | `UNIQUE uq_tipo_codigo` | Solo lectura en esta versión |
| `lectura.valor >= 0` | `CHECK` | No aplica en esta versión |

## 5. Consecuencias que sorprenden

- **Retirar un suscriptor no libera su `numero`.** El `UNIQUE` sigue
  ocupado. Si la junta quiere reusar `AC-005` para otra casa, hay que
  enmendar el esquema o generar un número nuevo. No es un defecto: es la
  consecuencia correcta para conservar el histórico.
- **`GET /api/suscriptores` no lista los inactivos**, por `RF-01`. Pero
  `GET /api/suscriptores/{id}` **sí devuelve un inactivo**, porque la
  historia 4 exige poder consultarlo. Son dos comportamientos distintos y
  hay que declararlos.
- **El `DEFAULT 1` de `activo`** hace que un `POST` sin el campo cree un
  activo. Correcto, pero conviene que el servicio no lo mande nunca: el
  default es la red, no el contrato.

## 6. Los datos con que arranca

Ver [`DATOS_DE_PRUEBA.md`](DATOS_DE_PRUEBA.md). Fuente única:
`db/bdacueducto.sql`.

---

## Criterio de cierre

- [x] Cada tabla del recorte sale de una entidad del modelo conceptual
- [x] Cada regla que la base defiende está citada
- [x] Los datos remiten a su documento de procedencia