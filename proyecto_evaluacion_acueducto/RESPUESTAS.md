# Respuestas de sustentación — **30 % de la nota**

---

## Identificación

| | |
|---|---|
| **Nombre** | {{...}} |
| **Usuario de GitHub** | {{...}} |
| **Repositorio** | `https://github.com/{{...}}/evaluacion_aysw_supletorio` |
| **Hasta qué fase llegó** | {{...}} |

---

> ## Cómo se califica esto — **léalo antes de responder**
>
> **Toda respuesta cita SU código, con archivo y línea.** Así:
>
> > `api_acueducto/Servicios/ServicioSuscriptor.cs:47`
> > ```csharp
> > if (await _repo.ExisteNumeroAsync(peticion.Numero))
> >     throw new ReglaVioladaExcepcion("Ya existe un suscriptor con ese número");
> > ```
>
> **Una respuesta sin archivo y línea vale cero**, aunque sea correcta. Lo que
> se evalúa no es que sepa la definición: es que **reconozca el concepto dentro
> de lo que usted escribió**.
>
> **Y si algo no lo alcanzó, dígalo y razone lo que habría hecho.** «No alcancé
> el `PATCH`, pero lo habría separado en otra clase porque…» **suma**. Afirmar
> que lo hizo, cuando el repositorio dice que no, **resta el doble**.

---

## 1 · Su historial — lo que dice de cómo trabajó *(4 %)*

**a.** Pegue la salida de:

```bash
git log --oneline
```

```
```

**b.** Señale **un commit de corrección** suyo y explique **qué respondió el
sistema** antes de arreglarlo, y **por qué respondía eso**.

> Si no tiene ninguno, dígalo — y diga entonces en qué momento sí se le rompió
> algo y cómo lo resolvió.

```
```

**c.** **Mire las horas de sus commits.** ¿Están repartidas o están juntas?
Explique a qué se debe, sin adornos.

```
```

---

## 2 · SDD — La ambigüedad que usted encontró *(3 %)*

El enunciado y el contexto **no dicen todo**. En alguna parte hay algo que se
puede leer de dos maneras.

**a.** ¿Cuál encontró? **Cite la frase y el minuto.**

```
```

**b.** ¿Qué decidió, y **qué habría cambiado en su código** si hubiera decidido
lo otro? Nombre el archivo que sería distinto.

```
```

> **Si responde que no encontró ninguna, no la buscó.** Y eso se califica: leer
> buscando contradicciones es parte del trabajo, no un extra.

---

## 3 · SDD — La compuerta que usted se saltó *(2 %)*

`9_checklist.md` se firma **antes** de la primera línea de código.

**a.** ¿Lo firmó antes? **Demuéstrelo con las horas de dos commits** — el del
checklist y el del primer archivo `.cs`.

```
```

**b.** Si lo firmó después —que es lo que suele pasar—, **diga qué se perdió
por hacerlo así**. No se trata de confesar: se trata de que sepa para qué
servía la compuerta.

```
```

---

## 4 · Capas — La línea que rompería todo *(4 %)*

**a.** Copie **una línea real de su servicio** y explique por qué **esa línea
no podría estar en el repositorio**.

```
```

**b.** Ahora al revés: escriba una línea que **compilaría y funcionaría**
dentro de su controlador, pero que **rompería las capas**. Explique por qué
funcionaría y por qué sigue estando mal.

> No la deje en el código. Escríbala aquí solamente.

```
```

**c.** ¿Cómo lo detecta la prueba de la Fase 4 — y qué caso **no** detectaría?

> **Pista:** la prueba lee texto. Piense en algo que rompa las capas sin usar
> ninguna de las palabras que ella busca.

```
```

---

## 5 · SOLID — El cambio que no debería dolerle *(3 %)*

La junta consigue un servidor con PostgreSQL y hay que migrar.

**a.** **Nombre los archivos suyos que cambiarían.** Ruta completa.

```
```

**b.** **Nombre tres que NO cambiarían** y diga **qué principio** se lo
garantiza y **cómo** lo garantiza —no el nombre del principio: el mecanismo
concreto de su código—.

```
```

**c.** **¿Hay algo en su proyecto que sí dolería y no debería?** Si encuentra
un sitio donde se le coló una dependencia del motor fuera del repositorio,
dígalo. **Encontrarlo suma; no tenerlo también.**

```
```

---

## 6 · P.O.O. — Tres clases para lo mismo *(3 %)*

Usted tiene `Suscriptor`, `SuscriptorCrear` y `SuscriptorActualizar`.

**a.** Haga la tabla de **qué campo tiene cada una**, y explique **cada
diferencia**.

| Campo | `Suscriptor` | `SuscriptorCrear` | `SuscriptorActualizar` | Por qué |
|---|---|---|---|---|
| | | | | |

**b.** **Con los datos del script**: ¿qué pasaría exactamente si usara
`Suscriptor` como cuerpo del `POST`? Dé la petición concreta y la respuesta
concreta.

```
```

**c.** ¿Por qué `SuscriptorActualizar` tiene los campos **anulables** y eso
**no** es un descuido?

```
```

---

## 7 · Verbos — El caso que los separa *(3 %)*

**a.** Muestre **sus dos clases** de petición, `PUT` y `PATCH`.

```
```

**b.** Escriba **una sola petición** que el `PUT` **rechace** y el `PATCH`
**acepte**, con el cuerpo exacto y los dos códigos de respuesta.

```
```

**c.** El `DELETE` es **retiro lógico**. Con el script dado: después de
`DELETE /api/suscriptores/1`, **¿qué devuelven `GET /api/suscriptores` y
`GET /api/suscriptores/1`?** Explique por qué **no** es lo mismo.

```
```

---

## 8 · Asincronía — Qué pasa mientras se espera *(2 %)*

**a.** Copie **una firma `async`** de su repositorio y diga **qué hace el hilo**
mientras la base responde.

```
```

**b.** Si usted quitara todos los `async` y dejara todo síncrono, **el
resultado que ve el usuario sería el mismo**. Entonces, ¿qué se pierde? Sea
concreto: **con cuántos usuarios simultáneos empezaría a notarse**, y por qué.

```
```

---

## 9 · ACID y restricciones — Lo que la base le está defendiendo gratis *(3 %)*

**a.** El script tiene `UNIQUE (fk_suscriptor, periodo)`. **¿De qué frase del
contexto salió?** Cite el minuto.

```
```

**b.** Su servicio **también** debería comprobarlo antes de insertar. **¿Por
qué dos veces?** ¿Qué ve el usuario si deja que falle solo el motor?

```
```

**c.** En una versión futura hay que **registrar la lectura y recalcular el
consumo del período** en una sola operación. **¿Qué propiedad de ACID
necesita, y qué queda mal si no la usa?** Describa el estado exacto en que
quedaría la base.

```
```

---

## 10 · Pruebas — La que pasa y no sirve *(3 %)*

**a.** ¿Qué comprueba **exactamente** la prueba de capas de la Fase 4? Diga qué
lee y qué busca.

```
```

**b.** **Escriba una prueba hueca**: uno o dos renglones que pasarían siempre,
aunque su servicio estuviera completamente roto. Explique **por qué pasa**.

```
```

**c.** Ahora arréglela: **¿qué tendría que comprobar** para que sirva de algo?

```
```

**d.** Su prueba de capas **pasa con cero archivos**, si usted no ha escrito
nada. **¿Le parece bien o mal?** Justifique.

> No hay una respuesta correcta aquí: hay una respuesta razonada y una que no
> lo es.

```
```

---

## Firma de la lista de chequeo

| | |
|---|---|
| **`9_checklist.md` firmado** | ☐ Sí · ☐ No |
| **Fecha y hora de la firma** | {{...}} |
| **Commit donde consta** | {{hash}} |

---

## Lo que no alcanzó

**Sin adornos. Es información, no una confesión.**

| Qué | Hasta dónde llegó | Qué habría hecho |
|---|---|---|
| | | |
