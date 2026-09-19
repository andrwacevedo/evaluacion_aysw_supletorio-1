<!-- ------------------------------------------------------------------
     PLANTILLA · 3_plan.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... COMO se organiza el codigo de esta version
     SE ALIMENTA DE ..... ARQUITECTURA · CRONOGRAMA · 1_constitution
     ------------------------------------------------------------------ -->

# Plan — Versión {{N}}

> **Qué es este documento.** Cómo se organiza lo que `2_spec` pidió: la
> estructura, el orden y la compuerta 2.

---

## 1. Lo que hay que construir, contado

{{La tabla de volumen. A la izquierda lo que cuesta UNA unidad; a la derecha, la
versión entera. Los números son el costo declarado de la decisión de §3.}}

| | Una {{unidad}} | **La versión** |
|---|---|---|
| Archivos | {{n}} | **{{n}}** |

## 2. El stack: {{sin cambios / lo que cambia}}

{{Lo fija la constitución y no se vuelve a discutir aquí. Si algo cambia, va
como enmienda, no como nota.}}

## 3. La decisión de la versión

{{La decisión que define esta versión, en una frase, con el enlace a su
`D-vN-n` en `4_research`. Si esta versión no obliga a decidir nada, revise el
alcance: probablemente es un incremento, no una versión.}}

## 4. Lo que ya no hace falta cuidar

{{Lo que las versiones anteriores dejaron resuelto. Ahorra releer.}}

## 5. Las capas

{{Cómo se reparte el código. Remite a `ARQUITECTURA.md`, no lo repite.}}

## 6. El orden de construcción

{{En prosa. El detalle por fases va en `8_tasks`.}}

## 7. Chequeo de constitución — **LA COMPUERTA 2**

> **Artículo por artículo, sin saltarse ninguno.** Un artículo que no aplica se
> escribe «no aplica, porque...», no se deja en blanco.

| Artículo | ¿Se cumple? | Dónde se ve |
|---|---|---|
| {{n}} | | |

---

## Criterio de cierre

- [ ] **Todos** los artículos de la constitución revisados, incluidos los que
      no aplican
- [ ] La decisión de §3 tiene su `D-vN-n` en `4_research`
- [ ] Los números de §1 son el costo **declarado**, no una estimación

## Errores típicos

| Error | Cómo se ve |
|---|---|
| Saltarse artículos en la compuerta 2 | La tabla tiene menos filas que artículos |
| Repetir aquí la arquitectura | Dos verdades que se separan |
| «El stack no cambia» sin mirar | Y luego aparece un paquete nuevo sin decisión |
