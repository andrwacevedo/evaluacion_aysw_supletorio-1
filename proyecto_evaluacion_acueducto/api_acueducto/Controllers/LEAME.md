# Controladores — Fase 5

**La unica capa que sabe que existe HTTP.** Traduce en los dos sentidos:

```csharp
try
{
    var s = await _servicio.ObtenerAsync(id);
    return Ok(s);
}
catch (NoEncontradoExcepcion ex) { return NotFound(new { mensaje = ex.Message }); }
catch (ReglaVioladaExcepcion ex) { return UnprocessableEntity(new { mensaje = ex.Message }); }
```

**Los seis endpoints, con sus codigos:**

| Verbo | Ruta | Codigos |
|---|---|---|
| `GET` | `/api/suscriptores` | `200` — **solo los activos** |
| `GET` | `/api/suscriptores/{id}` | `200` · `404` |
| `POST` | `/api/suscriptores` | `201` · `422` |
| `PUT` | `/api/suscriptores/{id}` | `200` · `404` · `422` |
| `PATCH` | `/api/suscriptores/{id}` | `200` · `404` · `422` |
| `DELETE` | `/api/suscriptores/{id}` | `204` · `404` — **retiro logico** |

> **Ni una linea de SQL aqui.** Y ojo con el `GET` de la lista: devuelve los
> **activos**, pero el `GET` por id **si** devuelve un retirado. Es la
> pregunta 7c.
