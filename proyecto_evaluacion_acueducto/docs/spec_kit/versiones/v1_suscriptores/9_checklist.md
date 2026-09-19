<!-- ------------------------------------------------------------------
     PLANTILLA · 9_checklist.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... LA COMPUERTA 3 — se firma ANTES de la primera linea de codigo
     SE ALIMENTA DE ..... todo lo anterior · la matriz de trazabilidad
     ------------------------------------------------------------------ -->

# Lista de chequeo — Versión {{N}}

> **Esta es la compuerta 3.** Se firma **antes** de escribir la primera línea de
> código. Un checklist firmado después no es un checklist: es un informe.

---

## Cómo se usa

{{Quién la recorre, cuándo, y qué pasa si una casilla no se puede marcar.}}

> **Una casilla que no se puede marcar detiene la versión.** No se marca «casi».

## A. Claridad — ¿dice UNA sola cosa?

- [ ] {{...}}

## B. Alcance — ¿se sabe qué NO se hace?

- [ ] {{...}}

## C. {{La decisión que define esta versión}}

- [ ] {{...}}

## D. Verificabilidad — ¿se puede EJECUTAR cada criterio?

- [ ] Cada criterio de `2_spec` §5 tiene su comando en `7_quickstart`
- [ ] {{...}}

## E. Coherencia con la constitución

- [ ] **Todos** los artículos revisados en `3_plan` §7, incluidos los que no aplican
- [ ] Ninguna enmienda encubierta

## F. Trazabilidad

- [ ] Cada historia que el mapa asigna a esta versión tiene al menos un `RF-nn`
- [ ] Cada `RF-nn` de esta versión tiene criterio de aceptación
- [ ] Ninguna referencia colgante: todo `RF`, `RNF`, `RN` y `D-vN-n` citado existe

## G. Lo que esta versión aprendió **después de firmar**

> **Esta sección se llena al cerrar, no al firmar.** Es lo que se supo después,
> y es de lo más valioso del documento: **impide que el kit parezca que nació
> sabiéndolo todo.**

{{...}}

---

## Firma

| | |
|---|---|
| **Quién firma** | {{nombre}} |
| **Fecha** | {{dd/mm/aaaa}} |
| **Se firma ANTES de** | la primera línea de código de esta versión |

---

## Errores típicos

| Error | Por qué invalida la compuerta |
|---|---|
| Firmar **después** de construir | Deja de ser una compuerta |
| Marcar «casi» | Una casilla o se puede marcar o detiene la versión |
| §G vacía al cerrar | Nadie releyó, o nadie aprendió nada — las dos son malas |
