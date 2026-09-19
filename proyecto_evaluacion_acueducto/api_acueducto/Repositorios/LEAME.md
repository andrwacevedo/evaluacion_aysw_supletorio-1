# Repositorios — Fase 3

**La interfaz y su implementacion, separadas:**

```
IRepositorioSuscriptor.cs             <- que se puede pedir
RepositorioSuscriptorSqlServer.cs     <- como se resuelve, con SQL
```

**Todo el SQL vive aqui. Nada de SQL fuera de esta carpeta.**

> **Parametrizado siempre**, incluso en una evaluacion de cuatro horas:
>
> ```csharp
> cmd.CommandText = "SELECT * FROM suscriptor WHERE numero = @numero";
> cmd.Parameters.AddWithValue("@numero", numero);
> ```
>
> Concatenar el valor en la cadena es inyeccion SQL.

**El nombre de la clase lleva el motor** —`...SqlServer`— y eso no es un
capricho: es lo que hace que la pregunta 5 tenga respuesta. El dia que sea
PostgreSQL, se agrega `RepositorioSuscriptorPostgres` **al lado**, y el
servicio no se entera.
