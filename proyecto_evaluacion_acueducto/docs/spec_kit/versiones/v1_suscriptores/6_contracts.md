<!-- ------------------------------------------------------------------
     PLANTILLA · 6_contracts.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... QUE promete la API y que promete la pantalla
     SE ALIMENTA DE ..... 5_data_model · RF de esta version · POLITICA_DE_ERRORES
     ------------------------------------------------------------------ -->

# Contratos — Versión {{N}}

> **Qué es este documento.** Lo que un consumidor puede esperar: rutas, verbos,
> códigos de estado y formatos **exactos**.

---

## 1. La API se documenta sola, y eso es parte del contrato

{{Cómo se publica el contrato —OpenAPI, Swagger— y por qué eso **es** un
requisito y no una comodidad.}}

## 2. El sobre de error

> Remite a [`POLITICA_DE_ERRORES.md`]({{ruta}}). **No inventa códigos aquí.**

| Código | Cuándo | Quién lo produce |
|---|---|---|
| {{...}} | {{...}} | {{el framework / el servicio / la base}} |

## 3. Los recursos

{{Uno por uno. Verbo, ruta, cuerpo, respuesta, errores.}}

### {{recurso}}

| Verbo | Ruta | Éxito | Error |
|---|---|---|---|
| `GET` | `/api/{{recurso}}` | 200 | — |

## 4. {{El recurso que se sale del patrón}}

{{Sus diferencias, **declaradas**. Si no hay ninguno, borre esta sección y
diga por qué en §3.}}

## 5. El contrato de las pantallas

{{Qué dirección tiene cada pantalla y qué hace. Una pantalla también promete.}}

## 6. Lo que un consumidor debe saber antes de integrarse

{{Lo que no se deduce del contrato: límites, formatos de fecha, qué pasa con
los inactivos.}}

---

## Criterio de cierre

- [ ] Cada `RF-nn` de `2_spec` tiene su ruta aquí
- [ ] El contraste entre **reemplazo completo** y **cambio parcial** está dicho
- [ ] Los códigos de error **citan** la política, no la reinventan
- [ ] Cada pantalla tiene una dirección **que se puede guardar como marcador**

## Errores típicos

| Error | Cómo se ve |
|---|---|
| Inventar códigos por versión | Cada versión responde distinto al mismo error |
| Rutas con el nombre de la tabla como parámetro | El contrato no puede describir nada |
| Olvidar el contrato del front | «Una versión incluye su front» deja de cumplirse |
