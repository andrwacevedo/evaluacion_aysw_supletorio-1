<!-- ------------------------------------------------------------------
     PLANTILLA · 1_constitution.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... Que NO se negocia mientras dure el proyecto
     SE ALIMENTA DE ..... REQUISITOS_NO_FUNCIONALES · ARQUITECTURA ·
                          MANUAL_DE_MARCA · POLITICA_DE_ERRORES

     OJO: esta NO es una plantilla de version. Se escribe UNA VEZ por
     proyecto, y todas las versiones la heredan. Va en docs/spec_kit/,
     no dentro de la carpeta de una version.
     ------------------------------------------------------------------ -->
# Constitución del proyecto — Junta de Acueducto Veredal

| | |
|---|---|
| **Versión de este documento** | 1.0 |
| **Fecha** | 19/09/2026 |
| **Enmiendas** | ninguna todavía |

---

## Cómo se lee esta constitución

Cada artículo dice **tres** cosas: la regla, el porqué y cómo se comprueba.
Un artículo sin comprobación es una intención.

---

## Artículo 1 — Se construye por versiones, y la especificación manda

**La regla.** Ninguna versión empieza a codificarse hasta que su spec kit
está completo y comiteado. El código sigue a la especificación, no al revés.

**Por qué.** La evaluación se lee en el historial de Git. Un spec kit
posterior al código no se distingue de una justificación escrita a las 5:55.

**Cómo se comprueba.** `git log --oneline` muestra los commits del spec kit
**antes** del primer commit que toca un archivo `.cs`.

---

## Artículo 2 — El stack

**La regla.** API en **C# / ASP.NET Core** sobre **SQL Server 2022**. El
front, en la tecnología que se elija (React, Vue, Razor, HTML+JS). La
persistencia se hace con **ADO.NET / Microsoft.Data.SqlClient**. No se usa
Entity Framework ni otro ORM.

**Por qué.** El ejercicio pide ver las consultas parametrizadas en el
repositorio. Un ORM las esconde y con ellas la capa que se evalúa.

**Cómo se comprueba.** `grep -r "EntityFramework" api_acueducto/` devuelve
vacío. `grep -rn "SqlConnection\|SqlCommand" api_acueducto/` devuelve las
consultas de la capa de repositorio, y solo de ahí.

---

## Artículo 3 — La arquitectura son tres capas, y el servicio no conoce HTTP

**La regla.** `Controlador → Servicio → Repositorio → SQL Server`. El
controlador no escribe SQL. El servicio no menciona HTTP. El repositorio no
decide reglas de negocio. El detalle vive en `ARQUITECTURA.md`.

**Por qué.** Es lo que permite cambiar SQL Server por PostgreSQL sin tocar
controladores ni servicios. Es también lo que hace la prueba de capas
posible.

**Cómo se comprueba.** La prueba de la Fase 4 pasa: ningún archivo bajo
`Servicios/` contiene `IActionResult`, `Controller`, `Http`, `StatusCodes`
ni `200`/`404` literales.

---

## Artículo 4 — El sistema se levanta con un solo comando

**La regla.** `docker compose up -d --build`, desde cero, deja en pie los
tres servicios: base, API y front. Sin instalar nada a mano en la máquina.

**Por qué.** El enunciado lo pide explícitamente en la Fase 7 y es lo que
distingue un proyecto entregable de uno que solo corre en el portátil de
quien lo escribió.

**Cómo se comprueba.** Se corre el comando en una máquina limpia, se espera
a que los tres contenedores estén `healthy` y se hace
`GET http://localhost:8132/api/suscriptores` → `200` con seis filas.

---

## Artículo 5 — El esquema de datos viene dado y no se modifica

**La regla.** `db/bdacueducto.sql` se entrega hecho. Las tres tablas, sus
restricciones y los datos de prueba **no se alteran**. Si algo del código
necesita un cambio en el esquema, es una enmienda a esta constitución, no
una edición del script.

**Por qué.** El ejercicio evalúa la construcción sobre el modelo, no su
diseño. Tocar el esquema invalida la comparación con el enunciado.

**Cómo se comprueba.** `git diff db/bdacueducto.sql` sobre el commit inicial
devuelve vacío durante toda la versión.

---

## Artículo 6 — Nada se borra: se retira

**La regla.** El `DELETE` de `suscriptor` es **retiro lógico**: marca
`activo = 0`. Ningún repositorio emite `DELETE FROM` sobre `suscriptor`,
`tipo_suscriptor` ni `lectura`.

**Por qué.** La historia 4 y la cita `12:30` lo dicen: hay que poder
responder por el consumo de un predio en 2024 aunque el titular se haya
retirado. Y el `numero` sigue ocupando su `UNIQUE`, lo que es correcto.

**Cómo se comprueba.** `grep -rn "DELETE FROM" api_acueducto/` devuelve
vacío. Y tras `DELETE /api/suscriptores/1`, la fila sigue en la base con
`activo = 0`.

---

## Artículo 7 — Los secretos viven fuera del repositorio

**La regla.** La cadena de conexión, la contraseña de SQL Server y cualquier
credencial llegan por variable de entorno. **Nunca** están versionadas.

**Por qué.** El repositorio es privado, pero la visibilidad se cambia con un
clic y el clic no revisa el historial. Un secreto comiteado queda en el
historial para siempre.

**Cómo se comprueba.** `grep -rn "Password=\|Acueducto2026" api_acueducto/`
devuelve vacío. La cadena aparece solo en `docker-compose.yml` como
`${CONEXION_BD}` o equivalente, y en `.env.example` con valor ficticio.

---

## Artículo 7.1 — Los requisitos no funcionales rigen siempre

**Rigen** `RNF-01` a `RNF-06` de
[`REQUISITOS_NO_FUNCIONALES.md`](REQUISITOS_NO_FUNCIONALES.md).

---

## Artículo 8 — Ninguna persona real entra al repositorio

**La regla.** Ni en la base, ni en los datos de prueba, ni en capturas, ni
en el README. Los correos usan `@example.com`. Los teléfonos son ficticios.
Los nombres, inventados.

**Por qué.** Que el repositorio sea privado no basta: la visibilidad cambia
con un clic y el historial no se reescribe solo.

**Cómo se comprueba.** `grep -rE "[0-9]{7,}" docs/ api_acueducto/` no
devuelve teléfonos reales; todos los datos coinciden con los del script
entregado.

---

## Artículo 9 — Todo en español, y el código sustenta sus decisiones

**La regla.** Código, comentarios, documentación y pantallas en español. Los
comentarios explican **por qué** está la línea, no qué hace.

**Por qué.** El dominio es una junta veredal. La jerga técnica en pantalla
es ruido para quien la usa.

**Cómo se comprueba.** Ninguna pantalla muestra `null`, `undefined`,
`exception`, `error 422` sin traducir. Los comentarios del repositorio
responden a "por qué", no a "qué".

---

## Artículo 9.1 — Identidad visual

No aplica: el enunciado no entrega manual de marca y el front es libre. Si
en una versión futura se entrega, se enmienda esta constitución.

---

## Artículo 10 — Los contratos son exactos

**La regla.** Verbos, rutas, cuerpos, códigos de estado y formatos están
fijados en `6_contracts.md`. Los códigos de error se citan de
[`POLITICA_DE_ERRORES.md`](POLITICA_DE_ERRORES.md); no se reinventan por
versión.

**Por qué.** Un contrato que cambia por versión no es un contrato. Un `200`
donde el enunciado pide `204` es una promesa rota.

**Cómo se comprueba.** Los seis endpoints responden con el código exacto
del contrato. La prueba manual de `7_quickstart.md` lo verifica.

---

## Artículo 10.1 — `PUT` y `PATCH` no comparten clase de petición

**La regla.** El cuerpo del `PUT` exige **todos** los campos. El cuerpo del
`PATCH` acepta **algunos**. Se modelan con clases distintas:
`SuscriptorCrear` y `SuscriptorActualizar`.

**Por qué.** Son dos promesas distintas al consumidor. Un `PATCH` que exige
todos los campos es un `PUT` mal escrito; un `PUT` que acepta algunos es un
`PATCH` mal etiquetado. Compartir la clase garantiza que uno de los dos esté
mal.

**Cómo se comprueba.** El `PATCH /api/suscriptores/3` con
`{"telefono":"3004455"}` responde `200`. El mismo cuerpo contra `PUT`
responde `422`.

> **Lo que este artículo NO prohíbe.** No prohíbe que `SuscriptorCrear` y
> `SuscriptorActualizar` compartan **campos**; prohíbe que compartan
> **clase**. Tampoco prohíbe un `Suscriptor` de lectura que las contenga a
> ambas.

---

## Artículo 11 — Convenciones fijas

**La regla.**
- Ramas: `main` única, commits directos (es evaluación individual).
- Carpetas: `api_acueducto/{Controladores,Servicios,Repositorios,Modelos,Peticiones}`.
- Archivos: PascalCase para clases, prefijo `I` para interfaces.
- Commits: `Fase N — <título>\n\n<cuerpo con lo que se probó>`.

**Cómo se comprueba.** `git log --oneline` muestra el prefijo de fase en cada
commit. `ls api_acueducto/` coincide con la estructura declarada.

---

## Artículo 12 — Cómo se enmienda esta constitución

**La regla.** Una enmienda se hace por commit con mensaje
`enmienda: art-N — <razón>`, en `main`, antes de aplicar el cambio que la
motiva. El artículo enmendado conserva su número; la enmienda se anota en la
cabecera.

**Por qué.** Una constitución que se cambia en silencio no es una
constitución. Un artículo que deja de cumplirse o se enmienda con fecha y
razón, o se incumple y la compuerta 2 tiene que verlo.

**Cómo se comprueba.** La tabla de la cabecera tiene una fila por enmienda,
con fecha y motivo.

---

## Criterio de cierre

- [x] Cada artículo tiene regla, porqué y comprobación
- [x] Ningún artículo dice qué hace el sistema
- [x] Los RNF se citan, no se copian
- [x] El artículo 10.1 dice también qué NO prohíbe
- [x] Existe el artículo de enmienda y dice dónde queda el rastro