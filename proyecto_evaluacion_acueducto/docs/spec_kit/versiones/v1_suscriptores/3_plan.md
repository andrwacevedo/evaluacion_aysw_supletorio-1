<!-- ------------------------------------------------------------------
     PLANTILLA · 3_plan.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... COMO se organiza el codigo de esta version
     SE ALIMENTA DE ..... ARQUITECTURA · CRONOGRAMA · 1_constitution
     ------------------------------------------------------------------ -->

# Plan — Versión 1

## 1. Lo que hay que construir, contado

| | Una capa | **La versión** |
|---|---|---|
| Archivos `.cs` | 3–4 | **~18** |
| Endpoints | 1 | **6 + 1 de tipos** |
| Pantallas | 1 | **3** (listado, creación, edición) |
| Servicios Docker | 1 | **3** (bd, cargador, api, front) |

## 2. El stack: sin cambios

Lo fija la constitución (artículo 2) y no se vuelve a discutir aquí.

## 3. La decisión de la versión

**`D-v1-1`** — `PUT` y `PATCH` con clases de petición distintas. Va en
[`4_research.md`](4_research.md#d-v1-1--put-y-patch-usan-clases-de-petición-distintas).

## 4. Lo que ya no hace falta cuidar

Nada: es la primera versión. Todo se construye desde cero sobre el script
entregado.

## 5. Las capas

Las fija [`ARQUITECTURA.md`](ARQUITECTURA.md). No se repiten aquí.

## 6. El orden de construcción

El detalle por fases vive en [`8_tasks.md`](8_tasks.md). En prosa: primero se
levanta la base y se cuenta que trae las filas prometidas; después los
modelos, las peticiones, los repositorios, los servicios, los controladores,
el front, el compose completo y el cierre. **Una capa a la vez, cada una
probada antes de pasar a la siguiente.**

## 7. Chequeo de constitución — **LA COMPUERTA 2**

| Artículo | ¿Se cumple? | Dónde se ve |
|---|---|---|
| 1 — Spec antes que código | Sí | Los commits del spec kit son anteriores al primer `.cs` |
| 2 — Stack C#/SQL Server sin ORM | Sí | `grep -r EntityFramework` → vacío |
| 3 — Tres capas, servicio sin HTTP | Sí | `Servicios/` sin `IActionResult` ni `Http` |
| 4 — Un solo comando | Sí | Fase 7 de `8_tasks.md` |
| 5 — Esquema dado, no modificado | Sí | `git diff db/bdacueducto.sql` sobre el commit inicial → vacío |
| 6 — Borrado lógico | Sí | `grep -r "DELETE FROM"` → vacío |
| 7 — Secretos fuera | Sí | Cadena solo en `docker-compose.yml` como variable |
| 7.1 — RNF citados | Sí | `REQUISITOS_NO_FUNCIONALES.md` referenciado en `2_spec §4` |
| 8 — Sin datos personales | Sí | Datos del script, ficticios |
| 9 — Todo en español | Sí | Revisión de pantallas |
| 9.1 — Identidad visual | No aplica | El enunciado no entrega manual |
| 10 — Contratos exactos | Sí | Los seis endpoints del contrato |
| 10.1 — `PUT` ≠ `PATCH` | Sí | `D-v1-1` y `6_contracts.md` |
| 11 — Convenciones | Sí | Estructura de carpetas y mensajes de commit |
| 12 — Enmienda | Sí | Tabla de cabecera de la constitución |

---

## Criterio de cierre

- [x] Todos los artículos revisados, incluidos los que no aplican
- [x] La decisión de §3 tiene su `D-v1-1` en `4_research`
- [x] Los números de §1 son el costo declarado