<!-- ------------------------------------------------------------------
     PLANTILLA · 4_research.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... POR QUE se decidio cada cosa, y que se descarto
     SE ALIMENTA DE ..... las decisiones propias + las que aparecen al construir
     ------------------------------------------------------------------ -->
# Investigación y decisiones — Versión 1

> Cada decisión con lo que se descartó y por qué. Sin la alternativa
> descartada, una decisión no se puede discutir: solo se puede obedecer.

---

## D-v1-1 · `PUT` y `PATCH` usan clases de petición distintas

**Lo que se decidió.** `SuscriptorCrear` y `SuscriptorActualizar` son clases
separadas. El `PUT` usa `SuscriptorCrear` (todos los campos obligatorios,
salvo `telefono`). El `PATCH` usa `SuscriptorActualizar` (todos anulables).

**Contexto.** El enunciado lo repite tres veces: "si comparten, uno de los
dos está mal — necesariamente". Hay que decidirlo antes de escribir las
peticiones.

**Alternativas descartadas.**

| Alternativa | Por qué se descartó |
|---|---|
| Una sola clase con campos anulables | El `PUT` dejaría de exigir todos los campos. Se convierte en un `PATCH` mal etiquetado |
| Una sola clase con campos obligatorios | El `PATCH` exigiría todos. La corrección de un teléfono falla con `422` |
| Dos clases, pero heredando de una base | Herencia en DTOs de request añade acoplamiento sin ahorrar líneas. Un campo nuevo en la base obliga a tocar dos sitios |

**Consecuencias — incluida la que duele.**

Se gana: el contrato es honesto; el `422` del `PUT` y el `200` del `PATCH`
salen solos; el front puede mandar solo el campo editado.

Se sacrifica: **duplicación de campos**. Un cambio en el esquema de
`suscriptor` obliga a tocar dos clases. Es el precio de tener dos contratos
distintos, y se paga a gusto.

---

## D-v1-2 · El `409` para número duplicado

**Lo que se decidió.** Crear o reemplazar con un `numero` ya existente
devuelve **409 Conflict**, con `codigo: "Conflicto"`.

**Contexto.** El enunciado pide para el `POST`: `201` o `422`. Pero el
`UNIQUE (numero)` existe y puede violarse. Hay que decidir qué pasa.

**Alternativas descartadas.**

| Alternativa | Por qué se descartó |
|---|---|
| Devolver `422` | Mezcla validación de forma con conflicto de estado. Un `422` dice "el cuerpo está mal"; aquí el cuerpo está bien, el número ya existe |
| Dejar que el motor lance y devolver `500` | El usuario ve "error interno" por algo que él puede corregir |
| Comprobar solo en el servicio | Bajo concurrencia, dos requests pasan la comprobación y una viola el `UNIQUE`. El motor defiende; el servicio traduce |

**Consecuencias — incluida la que duele.**

Se gana: el código de estado dice la verdad; el front puede mostrar "ese
número ya está en uso" sin adivinar.

Se sacrifica: el enunciado no lo lista. Es una decisión propia, y hay que
declararla en `6_contracts.md` y en la sustentación.

---

## D-v1-3 · El front conoce los tipos por un endpoint

**Lo que se decidió.** Existe `GET /api/tipos-suscriptor` para poblar el
combo de `fk_tipo`. No se codifican los tres tipos en el front.

**Contexto.** El enunciado lista seis endpoints, todos de `suscriptor`.
Ninguno devuelve tipos. Sin embargo, el formulario de creación necesita
ofrecer `RES`, `COM`, `OFI`.

**Alternativas descartadas.**

| Alternativa | Por qué se descartó |
|---|---|
| Codificar los tipos en el front | Si la junta agrega un tipo, hay que recompilar el front. Y el tipo es un dato, no una constante |
| No ofrecer combo: que el usuario digite el `id_tipo` | El usuario no conoce los ids. Es una regresión al cuaderno |
| Meter los tipos dentro de `GET /api/suscriptores` | Contamina el recurso. Los tipos no son parte del listado |

**Consecuencias — incluida la que duele.**

Se gana: el front es dato, no constante; agregar un tipo no toca el front.

Se sacrifica: se sale del "seis endpoints" del enunciado. Es defendible, pero
hay que sustentarlo. Si el tiempo aprieta, esta decisión se puede revertir
codificando los tipos en el front y dejando constancia.

---

## Lo que estas decisiones dicen en conjunto

Las tres decisiones tienen la misma forma: **el contrato manda, el atajo no**.
D-v1-1 evita que el `PUT` y el `PATCH` se confundan; D-v1-2 elige decir la
verdad al usuario aunque el enunciado no lo pida; D-v1-3 prefiere dato a
constante. El patrón es: cuando el enunciado no dice, se decide por lo que
el consumidor puede entender, no por lo que escribe menos líneas.

---

## Criterio de cierre

- [x] Cada decisión tiene al menos una alternativa descartada
- [x] Cada decisión declara qué se sacrificó
- [x] Los identificadores no se reutilizan
- [x] Una decisión derogada no se borra