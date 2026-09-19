<!-- ------------------------------------------------------------------
     PLANTILLA · 2_spec.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... QUE hace esta version, y como se comprueba
     SE ALIMENTA DE ..... REQUISITOS_FUNCIONALES · REQUISITOS_NO_FUNCIONALES · historias · REGLAS_DE_NEGOCIO
     ------------------------------------------------------------------ -->

# Especificación — Versión {{N}}: {{QUÉ CONSTRUYE, EN CINCO PALABRAS}}

> **Qué es este documento.** El **contrato de esta versión**: qué hace, qué
> deja fuera, y cómo se comprueba que quedó.
>
> {{Si es la primera versión del proyecto, DÍGALO AQUÍ. Si parte del estado que
> dejó otra, diga cuál y qué hereda.}}

---

## 1. Propósito

{{Una o dos frases: qué problema resuelve ESTA versión. No el proyecto: esta
versión.}}

{{Y la pregunta que esta versión obliga a contestar y las anteriores no. Si no
hay ninguna, la versión probablemente es demasiado pequeña o demasiado grande.}}

## 2. Alcance

**Incluye:**

- {{...}}

**NO incluye** — y no se anticipa nada de esto:

- {{...}}

> **El NO-alcance es la mitad útil de esta sección.** Un alcance sin su
> complemento no limita nada.

## 3. Requisitos funcionales

> **Esta versión realiza `RF-{{nn}}` a `RF-{{nn}}`** del catálogo
> [`REQUISITOS_FUNCIONALES.md`]({{ruta}}).
> **El catálogo es la fuente**: dice qué es cada requisito, de qué historia
> sale y qué regla lo restringe. **Esta tabla dice otra cosa** — dónde se
> realiza cada uno en esta versión— y por eso **no lo repite: lo cita.**

| ID | Se realiza como | Y en la pantalla |
|---|---|---|
| `RF-{{nn}}` | {{la ruta}} | {{qué ve el usuario}} |

## 4. Requisitos no funcionales

> **Rigen `RNF-{{nn}}` a `RNF-{{nn}}`** de [`REQUISITOS_NO_FUNCIONALES.md`]({{ruta}}).
> Aquí van **solo los que esta versión estrena o mide**, con su comprobación
> concreta. Los transversales ya están en la constitución.

| ID | Cómo se comprueba EN ESTA VERSIÓN |
|---|---|
| `RNF-{{nn}}` | {{el comando o la acción}} |

## 5. Criterios de aceptación

> **Regla dura:** si no puede escribir el comando que lo comprueba, **no es un
> criterio**. Reescríbalo hasta que lo sea.

| # | Criterio | Cómo se comprueba |
|---|---|---|
| 1 | {{...}} | {{comando + salida esperada}} |

## 6. Fuera de discusión en esta versión

{{Lo que ya decidió la constitución y aquí no se vuelve a abrir. Se lista para
que nadie gaste tiempo.}}

## 7. Lo que esta versión NO logró, y queda escrito

{{Se llena AL CERRAR, no al empezar. Lo que se intentó y no salió, y por qué.
Si queda vacío al final, casi siempre es que nadie lo releyó.}}

---

## Criterio de cierre de este documento

- [ ] Cada `RF-nn` de esta versión aparece, **citado y no copiado**
- [ ] Cada criterio de aceptación tiene **un comando** al lado
- [ ] El NO-alcance tiene al menos tantas líneas como el alcance
- [ ] §7 está vacía **porque la versión aún no cerró**, no porque se olvidó

## Errores típicos

| Error | Cómo se ve |
|---|---|
| **Repetir el catálogo** en vez de citarlo | En dos semanas dicen cosas distintas |
| **Criterios sin número ni código de estado** | «debe funcionar bien» |
| **Alcance sin NO-alcance** | La versión crece sin que nadie lo decida |
| **Copiar el §1 de la versión anterior** | Dice el propósito del proyecto, no el de esta versión |
