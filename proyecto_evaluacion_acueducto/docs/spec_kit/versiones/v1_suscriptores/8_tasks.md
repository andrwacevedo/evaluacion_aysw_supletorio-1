<!-- ------------------------------------------------------------------
     PLANTILLA · 8_tasks.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... EN QUE ORDEN se construye, por fases
     SE ALIMENTA DE ..... 3_plan + 6_contracts, partidos en fases verificables
     ------------------------------------------------------------------ -->

# Tareas — Versión {{N}}

> **Cada fase termina en algo que se puede mirar correr.** No hay una fase que
> solo produzca archivos.
>
> **Y una fase no termina porque el código esté escrito: termina cuando se
> probó.**

---

## Fase 0 · Partir de {{lo que ya hay}}

{{Si es la primera versión, lo único dado es el esquema. Dígalo.}}

| # | Tarea | Hecho |
|---|---|---|
| 0.1 | {{...}} | ☐ |

**Comprobación de la fase:** {{cómo se sabe que terminó}}

## Fase 1 · {{la unidad de referencia, sola}}

{{Va primero porque es el patrón. Construir todas a la vez es multiplicar la
oportunidad de equivocarse en lo mismo.}}

| # | Tarea | Archivo |
|---|---|---|
| 1.1 | {{...}} | {{...}} |

**Comprobación de la fase:** {{...}}

## Fase 2 · {{la prueba que valida el patrón, ANTES de repetirlo}}

## Fase {{n}} · {{las demás}}

## Fase {{n}} · Correrlo, que es cuando aparecen los defectos

## Fase {{n}} · Documentar y cerrar

---

## Lo que esta versión enseñó sobre el orden

{{Se llena AL CERRAR. Qué fase salió mal, qué había que haber hecho antes.}}

---

## Criterio de cierre

- [ ] Cada fase tiene **su comprobación**, y no es «revisar que esté»
- [ ] Ninguna fase produce solo archivos
- [ ] Hay **un commit por fase**, con lo que se probó en cada una

## Errores típicos

| Error | Cómo se ve |
|---|---|
| Fases por capa —«todos los modelos», «todos los servicios»— | Nada se puede probar hasta el final |
| Construir todas las unidades a la vez | El mismo error, repetido n veces |
| Fase sin comprobación | Se da por terminada sin saberlo |
