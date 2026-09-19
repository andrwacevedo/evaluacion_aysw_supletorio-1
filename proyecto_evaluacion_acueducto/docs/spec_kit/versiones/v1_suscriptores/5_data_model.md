<!-- ------------------------------------------------------------------
     PLANTILLA · 5_data_model.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... QUE datos toca esta version y que defiende la base
     SE ALIMENTA DE ..... el diseno de BD, recortado a esta version · REGLAS_DE_NEGOCIO
     ------------------------------------------------------------------ -->

# Modelo de datos — Versión {{N}}

> **Qué es este documento.** Las tablas que **esta versión** toca. No el modelo
> completo: **el recorte**. El modelo entero vive en el diseño de base de datos.

---

## 1. Cuáles son, y por qué son estas

{{Qué tablas entran y **qué criterio las eligió**. «Las que no tienen clave
foránea», «las que cuelgan de X»... El criterio importa más que la lista.}}

## 2. En qué se parecen

{{El patrón común, si lo hay. Es lo que permite construir una y repetir.}}

## 3. La que NO comparte la forma

{{Casi siempre hay una. Decir en qué se sale del patrón **antes** de construir
evita descubrirlo a mitad.}}

## 4. Lo que la base defiende, y la API deja pasar a propósito

| Regla | La defiende | Y la API… |
|---|---|---|
| `RN-{{nn}}` | {{CHECK / UNIQUE / disparador}} | {{la deja pasar / la traduce}} |

> **Esta tabla es la que más sorprende al calificar.** Que la base defienda algo
> no significa que la API lo explique bien.

## 5. Consecuencias que sorprenden

{{Las cosas que solo se descubren al usarlo. Se escriben ANTES, para que no
haya que descubrirlas.}}

## 6. Los datos con que arranca

{{Remite a `DATOS_DE_PRUEBA.md`. **No inventa filas aquí.**}}

---

## Criterio de cierre

- [ ] Cada tabla del recorte sale de una entidad del modelo conceptual
- [ ] Cada `RN-nn` que la base defiende está citada, **no reescrita**
- [ ] Los datos remiten a su documento de procedencia

## Errores típicos

| Error | Cómo se ve |
|---|---|
| Copiar el modelo completo | El documento no dice qué toca ESTA versión |
| Inventar datos de ejemplo aquí | Dos juegos de datos que se separan |
| Omitir la tabla rara | Se descubre a mitad de la fase 3 |
