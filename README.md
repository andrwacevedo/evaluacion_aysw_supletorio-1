# Evaluación individual — Aplicación y Servicios Web · **SUPLETORIO**

**Tecnología en Desarrollo de Software · Institución Universitaria ITM**

| | |
|---|---|
| **Grupo** | 580202009 — Aplicación y Servicios Web |
| **Carácter** | **Supletorio** |
| **Fecha** | **sábado 19 de septiembre de 2026** |
| **Hora** | **de 2:00 p. m. a 6:00 p. m.** |
| **Peso** | 20 % |
| **Stack** | **API en C# / ASP.NET Core sobre SQL Server** · front libre |
| **Repositorio del estudiante** | `evaluacion_aysw_supletorio`, **privado**, con `ccastro2050` invitado |

---

## Lo primero, y no es el problema

> ### Cree el repositorio **privado** e invite a **`ccastro2050`**
>
> No es el primer paso del trabajo: **es el requisito para empezar.**
>
> Si el repositorio es privado y yo no estoy invitado, **no puedo abrirlo**, y
> a las 6:00 p. m. no hay nada que calificar. En las evaluaciones anteriores
> esto pasó, y no hubo nota que poner.

**Los cuatro pasos están detallados en la
[PARTE 0 del enunciado](documentos/EVALUACION_INDIVIDUAL.md).** Incluye el
cuarto, que es el que se salta todo el mundo: **abrir el repositorio en el
navegador y comprobar con los ojos que sus archivos están ahí.**

---

## Qué hay aquí

| Carpeta | Qué es |
|---|---|
| [`documentos/`](documentos/) | **El enunciado.** Se lee, no se modifica |
| [`proyecto_evaluacion_acueducto/`](proyecto_evaluacion_acueducto/) | **El andamiaje.** Es lo que copia a su repositorio y llena |

### Lo que se le entrega hecho

| | |
|---|---|
| El problema y el contexto | La reunión con la tesorera de la junta |
| Las historias de usuario | Cinco, firmadas |
| **El modelo entidad-relación y el relacional** | Ya normalizados |
| **El script `db/bdacueducto.sql`** | **Probado**: corre limpio y carga 3 + 6 + 8 filas |
| El esqueleto | `docker-compose` a medias, las excepciones, y un `LEAME.md` en cada carpeta |

### Lo que usted produce

El **spec kit**, las **tres capas**, los **seis endpoints**, el **front**, el
**`docker-compose` completo** y **`RESPUESTAS.md`**.

---

## En qué se diferencia del enunciado de sus compañeros

**El problema es otro** —una junta de acueducto veredal, no un mercado
campesino— y **las preguntas de sustentación son más exigentes.**

No preguntan definiciones. Preguntan cosas como:

- *«Escriba una línea que compilaría dentro de su controlador pero rompería
  las capas. Explique por qué funcionaría y por qué sigue estando mal.»*
- *«¿Qué caso NO detectaría su prueba de capas?»*
- *«Escriba una prueba hueca: dos renglones que pasarían siempre, aunque su
  servicio estuviera roto.»*

**Todas se responden citando archivo y línea de su propio código.** Una
respuesta sin eso vale cero, aunque sea correcta: lo que se evalúa no es que
sepa la definición, sino que **reconozca el concepto dentro de lo que
escribió**.

`RESPUESTAS.md` vale **35 %**.

---

## Para empezar

1. **Cree el repositorio privado** e invite a `ccastro2050`. **Compruébelo.**
2. Lea [`EVALUACION_INDIVIDUAL.md`](documentos/EVALUACION_INDIVIDUAL.md) —
   empiece por la **PARTE 0**, que son los commits y el repositorio.
3. Copie `proyecto_evaluacion_acueducto/` a su repositorio.
4. **Fase 0:** levante la base y **cuente las filas**. Comitee.
5. **El spec kit completo**, y comitéelo. **Ahí se gana o se pierde.**
6. De ahí: **fase, prueba, commit.**
