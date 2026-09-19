# Servicios — Fase 4

**Aqui viven las reglas del negocio.** Es la capa que decide.

| Hace | No hace |
|---|---|
| Comprueba que el numero de suscripcion no exista ya | Devolver `NotFound()` |
| Comprueba que el tipo exista | Saber que existe un codigo 422 |
| Lanza `ReglaVioladaExcepcion` | Escribir SQL |

> **La regla: el servicio no sabe que existe HTTP.** Lanza excepciones del
> dominio; el controlador las traduce.
>
> La prueba de la Fase 4 lo comprueba **leyendo sus archivos como texto**. Por
> eso la pregunta 4c le pide algo incomodo: **que rompa las capas sin usar
> ninguna de las palabras que la prueba busca.** Se puede — y saber como se
> puede es lo que demuestra que entendio el limite.
