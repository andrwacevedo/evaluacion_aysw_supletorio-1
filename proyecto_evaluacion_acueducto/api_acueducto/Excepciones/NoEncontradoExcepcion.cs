namespace ApiAcueducto.Excepciones;

/// <summary>
/// La lanza el SERVICIO cuando le piden algo que no existe.
///
/// Por que una excepcion y no devolver null: porque el servicio NO PUEDE
/// saber que eso se traduce en un 404. Eso lo decide el controlador, que es
/// la unica capa que sabe que existe HTTP.
///
/// Si su servicio devuelve IActionResult o NotFound(), las capas estan rotas
/// y la prueba de la Fase 4 lo marca.
/// </summary>
public class NoEncontradoExcepcion : Exception
{
    public NoEncontradoExcepcion(string mensaje) : base(mensaje) { }
}

/// <summary>
/// La lanza el SERVICIO cuando los datos violan una regla del negocio: el
/// numero de suscripcion repetido, un tipo que no existe, una lectura
/// duplicada para el mismo periodo. El controlador la traduce a 422.
/// </summary>
public class ReglaVioladaExcepcion : Exception
{
    public ReglaVioladaExcepcion(string mensaje) : base(mensaje) { }
}
