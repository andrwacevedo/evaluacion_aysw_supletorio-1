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

# Constitución del proyecto — {{NOMBRE DEL PROYECTO}}

> **Qué es este documento.** Lo que **no se negocia** mientras dure el
> proyecto. No dice qué hace el sistema —eso es `2_spec`, y cambia en cada
> versión—: dice **bajo qué reglas se construye**.
>
> **Es una política, no una especificación.** Por eso no se reescribe por
> versión: se **enmienda**, y la enmienda deja rastro.

| | |
|---|---|
| **Versión de este documento** | {{1.0}} |
| **Fecha** | {{dd/mm/aaaa}} |
| **Enmiendas** | {{ninguna todavía}} |

---

## Cómo se lee esta constitución

Cada artículo dice **tres** cosas, y si le falta una no sirve:

1. **La regla**, en una frase.
2. **Por qué**, de forma que se pueda discutir — no «porque sí».
3. **Cómo se comprueba**, con un comando o una observación concreta.

> **Un artículo sin comprobación es una intención.** Y las intenciones no se
> verifican en la compuerta 2.

---

## Artículo 1 — {{Cómo se construye: por versiones, y la especificación manda}}

**La regla.** {{...}}

**Por qué.** {{...}}

**Cómo se comprueba.** {{...}}

> {{Si el proyecto versiona back y front juntos, dígalo AQUÍ y como artículo
> propio. Es la regla que más se rompe sin querer.}}

## Artículo 2 — {{El stack}}

{{Lenguaje, framework, motor de base de datos, y **qué se ve y qué se esconde**.
Si se decidió no usar un ORM, o usarlo, va aquí con su porqué.}}

## Artículo 3 — {{La arquitectura}}

{{Las capas y las interfaces. Remite a `ARQUITECTURA.md`, no lo repite.}}

**Cómo se comprueba.** {{La prueba que corre sin el motor de base de datos, o
la búsqueda que tiene que devolver vacío.}}

## Artículo 4 — {{Cómo se levanta}}

{{Un solo comando, cuántos procesos, qué puertos.}}

## Artículo 5 — {{De dónde viene el esquema de datos}}

{{¿Se diseña aquí o viene dado? Si viene dado, **no se modifica**, y eso hay
que escribirlo.}}

## Artículo 6 — {{Qué pasa cuando algo se borra}}

{{Borrado lógico o físico. Si es lógico: qué pasa con los valores únicos de lo
retirado. Esa consecuencia sorprende y conviene decirla aquí.}}

## Artículo 7 — {{Los secretos}}

{{Dónde viven las credenciales. **Nunca en el repositorio**, y cómo se
comprueba.}}

## Artículo 7.1 — {{Los requisitos no funcionales}}

> **Los transversales viven en su catálogo y este artículo los hace
> obligatorios.** No se copian aquí: se citan.

**Rigen siempre:** `RNF-{{nn}}`, `RNF-{{nn}}`, … de
[`REQUISITOS_NO_FUNCIONALES.md`]({{ruta}}).

## Artículo 8 — {{Datos personales}}

{{Qué datos pueden entrar al repositorio y cuáles no.}}

> **Y si la respuesta es «ninguno», el artículo tiene que explicar por qué no
> basta con que el repositorio sea privado.** La visibilidad se cambia con un
> clic y el clic no revisa el historial.

## Artículo 9 — {{El idioma, y que el código sustente sus decisiones}}

{{En qué idioma se escribe todo, y qué se espera de los comentarios: no qué
hace la línea, sino **por qué está**.}}

## Artículo 9.1 — {{La identidad visual}}

{{Si hay manual de marca, esto lo convierte en **restricción** y no en
preferencia. Remite a `MANUAL_DE_MARCA.md`.}}

## Artículo 10 — {{Los contratos}}

{{Qué tan exactos: verbos, rutas, códigos de estado, formatos. Remite a
`POLITICA_DE_ERRORES.md` para los códigos.}}

## Artículo 10.1 — {{La decisión de diseño que define el proyecto}}

{{Aquí va la decisión grande —la que si alguien la cambia, cambia el proyecto—.
Con su porqué **y con la excepción**, para que no sea dogma.}}

> **Escriba también qué NO prohíbe este artículo.** Un artículo sin su límite
> se aplica donde no debía.

## Artículo 11 — {{Las convenciones fijas}}

{{Nombres de archivos, de carpetas, de ramas. Lo aburrido que evita discusiones
semanales.}}

## Artículo 12 — Cómo se enmienda esta constitución

{{Quién puede, con qué procedimiento, y **dónde queda el rastro**.}}

> **Una constitución que se cambia en silencio no es una constitución.** Si un
> artículo deja de cumplirse, o se enmienda con su fecha y su razón, o se
> incumple — y entonces la compuerta 2 tiene que detectarlo.

---

## Criterio de cierre de este documento

- [ ] **Cada artículo tiene sus tres partes**: regla, porqué y comprobación
- [ ] Ningún artículo dice **qué hace** el sistema — eso es `2_spec`
- [ ] Los requisitos no funcionales transversales se **citan**, no se copian
- [ ] El artículo de la decisión grande dice **también qué NO prohíbe**
- [ ] Existe el artículo de enmienda, y dice **dónde queda el rastro**

## Errores típicos

| Error | Cómo se ve |
|---|---|
| **Meter aquí lo que hace el sistema** | El artículo cambia en la siguiente versión — y entonces no era una política |
| **Artículo sin comprobación** | «El código debe ser mantenible». Nadie lo verifica nunca |
| **Copiar aquí los requisitos no funcionales** | Dos verdades que se separan |
| **Enmendar en silencio** | Un artículo deja de cumplirse y nadie lo nota hasta la auditoría |
| **Dogma sin excepción** | El artículo se aplica donde no debía, y nadie se atreve a discutirlo |

---

## Lo que esta plantilla ya trae decidido, y usted puede heredar

Estos artículos son **casi iguales en cualquier proyecto** de este curso.
Cópielos y ajústelos, en vez de escribirlos de cero:

| Artículo | La regla, ya redactada |
|---|---|
| **SQL parametrizado** | *Todo valor que entre a una consulta va como parámetro. Nunca se concatena.* **Comprobación:** ninguna interpolación de valor en los repositorios |
| **Borrado lógico** | *Nada se borra: se marca inactivo. Los listados filtran.* **Comprobación:** cero `DELETE FROM` en los repositorios |
| **Secretos fuera** | *Ninguna credencial versionada; llegan por variables de entorno.* **Comprobación:** cero cadenas de conexión en el código |
| **Sin datos personales** | *Ninguna persona real, ni en la base ni en el repositorio.* **Comprobación:** los correos usan un dominio de ejemplo |
| **Todo en español** | *Código, comentarios, documentación y pantallas.* **Comprobación:** ninguna pantalla muestra jerga técnica al usuario |
| **Un solo comando** | *El sistema se levanta desde cero con un comando, sin instalar nada.* **Comprobación:** correrlo en una máquina limpia |
