# El prompt con el que generó el código — **10 % de la nota**

| | |
|---|---|
| **Nombre** | {{...}} |
| **Usuario de GitHub** | {{...}} |
| **Herramienta** | {{ChatGPT · Claude · Gemini · Copilot · Cursor · …}} |

---

> ## Qué se pide aquí
>
> **Uno solo:** el prompt con el que le **subió los ocho documentos del spec
> kit** a la IA y le pidió que generara el código.
>
> No los de cada duda que resolvió por el camino. **Ese**, el del paso grande:
> **spec kit → código.**
>
> **Se pega literal, como lo escribió.** No lo mejore al copiarlo: si le quedó
> corto o mal planteado, eso también es información, y decirlo suma más que
> maquillarlo.
>
> **Si no usó IA, escríbalo y explique cómo trabajó.** No resta: es una
> respuesta válida, y entonces esta sección se califica sobre la sección 5.

---

## 1 · Qué le subió

**Marque lo que efectivamente adjuntó o pegó:**

| | Documento | ¿Se lo dio? |
|---|---|---|
| | `1_constitution.md` | ☐ |
| | `2_spec.md` | ☐ |
| | `3_plan.md` | ☐ |
| | `4_research.md` | ☐ |
| | `5_data_model.md` | ☐ |
| | `6_contracts.md` | ☐ |
| | `7_quickstart.md` | ☐ |
| | `8_tasks.md` | ☐ |
| | `db/bdacueducto.sql` | ☐ |
| | El enunciado | ☐ |
| | Otro: {{...}} | ☐ |

> **Lo que no le dio, la IA lo inventó** — y lo inventó bien redactado, que es
> lo que lo hace difícil de ver.
>
> **Dos ejemplos concretos de este proyecto:**
>
> - Si dejó fuera **`6_contracts.md`**, revise sus códigos de estado: es muy
>   probable que su `DELETE` devuelva `200` en vez de `204`, o que el `PUT` no
>   distinga el `404` del `422`.
> - Si dejó fuera **`5_data_model.md`**, revise el `DELETE`: casi con
>   seguridad le generó un `DELETE FROM suscriptor`, porque **el retiro lógico
>   no se deduce del nombre de la tabla** — está escrito en el modelo.

---

## 2 · El prompt, literal

```
{{péguelo tal como lo escribió}}
```

---

## 3 · Qué devolvió

{{En cinco o seis líneas: qué archivos generó, si compilaban, si respetaban
las capas.}}

---

## 4 · Qué tuvo que corregir — **este es el que vale**

| Qué estaba mal | Cómo se dio cuenta | Qué hizo |
|---|---|---|
| {{p. ej.: el servicio devolvía `NotFound()`}} | {{la prueba de capas falló}} | {{lo cambié por una excepción del dominio}} |
| | | |
| | | |

> **Si esta tabla está vacía, hay dos posibilidades: o no usó IA, o no
> revisó.** Y la segunda se comprueba abriendo su código.
>
> **Corregir no resta: es lo que se evalúa.** El spec kit existe justamente
> para que usted tenga **contra qué comparar** lo que salga. Sin él, lo que
> devuelva la IA se acepta porque compila — y ese es el problema que esta
> asignatura existe para evitar.

---

## 5 · Si volviera a lanzarlo, ¿qué le agregaría al prompt?

{{Una o dos frases. Lo que aprendió de lo que salió mal.}}

---

> ### Por qué se pide esto, y no es control
>
> **Usar IA está permitido y es lo que va a hacer en el trabajo.** Lo que se
> evalúa es que usted pueda **dirigirla y revisarla**:
>
> | | Se ve en |
> |---|---|
> | **Dirigirla** | Qué le subió y cómo se lo pidió — secciones 1 y 2 |
> | **Revisarla** | Qué devolvió mal y cómo lo detectó — sección 4 |
>
> Y esto se cruza con `RESPUESTAS.md`: si aquí dice que no tuvo que corregir
> nada, pero la pregunta 4 le pide señalar una línea de su servicio y explicar
> por qué no puede estar en el repositorio, **la respuesta va a decir sola si
> usted leyó lo que entregó.**
