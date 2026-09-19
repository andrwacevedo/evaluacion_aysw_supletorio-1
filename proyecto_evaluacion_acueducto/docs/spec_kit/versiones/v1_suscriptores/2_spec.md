<!-- ------------------------------------------------------------------
     PLANTILLA · 2_spec.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... QUE hace esta version, y como se comprueba
     SE ALIMENTA DE ..... REQUISITOS_FUNCIONALES · REQUISITOS_NO_FUNCIONALES · historias · REGLAS_DE_NEGOCIO
     ------------------------------------------------------------------ -->
# Especificación — Versión 1: CRUD de suscriptores

> **Qué es este documento.** El contrato de esta versión: qué hace, qué deja
> fuera, y cómo se comprueba que quedó.
>
> **Es la primera versión del proyecto.** Parte del script entregado; no
> hereda nada de una versión anterior.

---

## 1. Propósito

Que la tesorera pueda **registrar, consultar, corregir y retirar
suscriptores** sin depender del cuaderno. Es la base sobre la que la versión
2 construirá el registro de lecturas.

La pregunta que esta versión obliga a contestar y las anteriores no: *¿cómo
separa un `PUT` de un `PATCH` sin duplicar el modelo de datos, y cómo
sobrevive el retiro lógico al `UNIQUE` del número?*

## 2. Alcance

**Incluye:**

- Listado de suscriptores activos, con filtro por tipo.
- Consulta individual.
- Creación, con validación de unicidad de `numero`.
- Reemplazo completo (`PUT`) y actualización parcial (`PATCH`), con clases
  de petición distintas.
- Retiro lógico (`DELETE` → `activo = 0`).
- Listado de tipos de suscriptor (para poblar el combo).
- Front que lista, crea, muestra el error del `422` en pantalla y no se cae
  con la API apagada.
- Docker compose completo.

**NO incluye** — y no se anticipa nada de esto:

- Registro de lecturas (`RF-08`).
- Cálculo de consumo.
- Reporte de "quién no ha reportado lectura".
- Detección de medidor cambiado.
- Autenticación.
- Reportes para la reunión.
- Importación masiva desde el cuaderno.

## 3. Requisitos funcionales

> Esta versión realiza `RF-01` a `RF-07` del catálogo
> [`REQUISITOS_FUNCIONALES.md`](REQUISITOS_FUNCIONALES.md).
> `RF-08` queda fuera.

| ID | Se realiza como | Y en la pantalla |
|---|---|---|
| `RF-01` | `GET /api/suscriptores?tipo={codigo}` | Tabla del padrón con filtro |
| `RF-02` | `GET /api/suscriptores/{id}` | Pantalla de detalle / edición |
| `RF-03` | `POST /api/suscriptores` | Formulario "Nuevo suscriptor" |
| `RF-04` | `PUT /api/suscriptores/{id}` | Botón "Guardar" en edición |
| `RF-05` | `PATCH /api/suscriptores/{id}` | Edición campo a campo |
| `RF-06` | `DELETE /api/suscriptores/{id}` | Botón "Retirar" |
| `RF-07` | `GET /api/tipos-suscriptor` | Combo de tipo en el formulario |

## 4. Requisitos no funcionales

> Rigen `RNF-01` a `RNF-06`. Aquí solo los que esta versión estrena o mide.

| ID | Cómo se comprueba EN ESTA VERSIÓN |
|---|---|
| `RNF-01` | `time curl http://localhost:8132/api/suscriptores` < 1s |
| `RNF-03` | `docker compose up -d --build` desde cero |
| `RNF-04` | Los cuatro errores (400, 404, 409, 422) tienen el sobre |

## 5. Criterios de aceptación

| # | Criterio | Cómo se comprueba |
|---|---|---|
| 1 | Listado devuelve solo activos | `curl .../api/suscriptores \| jq length` → `5` (no 6: `AC-005` está retirado) |
| 2 | Listado filtra por tipo | `curl "...?tipo=COM"` → `2` filas |
| 3 | Consulta individual devuelve 200 o 404 | `curl .../api/suscriptores/1` → 200; `.../9999` → 404 |
| 4 | Crear devuelve 201 | `POST` con `AC-007` → 201 |
| 5 | Crear con número duplicado devuelve 409 | Repetir el `POST` anterior → 409 |
| 6 | Crear con campo vacío devuelve 422 | `POST` sin `nombre_titular` → 422 |
| 7 | `PUT` exige todos los campos | `PUT .../3` con `{"telefono":"300..."}` → 422 |
| 8 | `PATCH` acepta algunos | `PATCH .../3` con `{"telefono":"300..."}` → 200 |
| 9 | `DELETE` es lógico | Tras `DELETE .../1`, `SELECT activo FROM suscriptor WHERE id=1` → `0` |
| 10 | `DELETE` devuelve 204 | `curl -i -X DELETE .../1` → `204` |
| 11 | El front no se cae con la API apagada | Apagar el contenedor de la API y recargar el front → mensaje "no se pudo conectar" y pantalla en pie |
| 12 | El front muestra el `422` en pantalla | Enviar formulario con `nombre_titular` vacío → el mensaje del servidor aparece en el formulario, no en la consola |

## 6. Fuera de discusión en esta versión

- El esquema viene dado (constitución, artículo 5).
- El `DELETE` es lógico (constitución, artículo 6).
- `PUT` y `PATCH` no comparten clase (constitución, artículo 10.1).
- El servicio no menciona HTTP (constitución, artículo 3).

## 7. Lo que esta versión NO logró, y queda escrito

*(Se llena AL CERRAR. Vacía porque la versión aún no cerró.)*

---

## Criterio de cierre

- [x] Cada `RF-nn` de esta versión está citado, no copiado
- [x] Cada criterio de aceptación tiene un comando al lado
- [x] El NO-alcance tiene más líneas que el alcance
- [ ] §7 está vacía porque la versión aún no cerró