# Modelos — Fase 1

**Sus clases entidad**: una por tabla. `Suscriptor`, `TipoSuscriptor`,
`Lectura`.

Son clases **sin logica**: propiedades y nada mas. No validan, no consultan,
no saben de HTTP.

> **Y no son lo mismo que las peticiones.** El modelo tiene `IdSuscriptor`;
> el cuerpo de un `POST` **no lo lleva**, porque lo genera la base. Esa
> diferencia es la pregunta 6 de `RESPUESTAS.md`.
