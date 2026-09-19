<!-- ------------------------------------------------------------------
     PLANTILLA · 7_quickstart.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... COMO se levanta y COMO se comprueba que quedo
     SE ALIMENTA DE ..... los criterios de 2_spec, vueltos comandos · DATOS_DE_PRUEBA
     ------------------------------------------------------------------ -->

# Arranque y comprobación — Versión 1

## 1. Levantar el sistema

\`\`\`bash
docker compose up -d --build
\`\`\`

| Qué | Dónde |
|---|---|
| SQL Server | `localhost:11478` |
| API | `localhost:8132` |
| Swagger | `http://localhost:8132/swagger` |
| Front | `localhost:8133` |

Esperar a que `docker compose ps` muestre los tres servicios en `healthy`
o `running`.

## 2. Las pruebas

Una por criterio de `2_spec §5`.

### Criterio 1 — Listado solo activos

\`\`\`bash
curl -s http://localhost:8132/api/suscriptores | jq length
\`\`\`

**Debe responder:** `5`

### Criterio 2 — Filtro por tipo

\`\`\`bash
curl -s "http://localhost:8132/api/suscriptores?tipo=COM" | jq length
\`\`\`

**Debe responder:** `2`

### Criterio 3 — Consulta individual

\`\`\`bash
curl -s -o /dev/null -w "%{http_code}\n" http://localhost:8132/api/suscriptores/1
curl -s -o /dev/null -w "%{http_code}\n" http://localhost:8132/api/suscriptores/9999
\`\`\`

**Debe responder:** `200` y `404`.

### Criterio 4 — Crear

\`\`\`bash
curl -s -o /dev/null -w "%{http_code}\n" -X POST http://localhost:8132/api/suscriptores \
  -H "Content-Type: application/json" \
  -d '{"numero":"AC-007","nombre_titular":"Prueba","predio":"Lote 99","fk_tipo":1}'
\`\`\`

**Debe responder:** `201`

### Criterio 5 — Número duplicado

Repetir el comando anterior.

**Debe responder:** `409`

### Criterio 6 — Campo vacío

\`\`\`bash
curl -s -o /dev/null -w "%{http_code}\n" -X POST http://localhost:8132/api/suscriptores \
  -H "Content-Type: application/json" \
  -d '{"numero":"AC-008","nombre_titular":"","predio":"Lote 100","fk_tipo":1}'
\`\`\`

**Debe responder:** `422`

### Criterio 7 — `PUT` exige todos los campos

\`\`\`bash
curl -s -o /dev/null -w "%{http_code}\n" -X PUT http://localhost:8132/api/suscriptores/3 \
  -H "Content-Type: application/json" \
  -d '{"telefono":"3004455"}'
\`\`\`

**Debe responder:** `422`

### Criterio 8 — `PATCH` acepta algunos

\`\`\`bash
curl -s -o /dev/null -w "%{http_code}\n" -X PATCH http://localhost:8132/api/suscriptores/3 \
  -H "Content-Type: application/json" \
  -d '{"telefono":"3004455"}'
\`\`\`

**Debe responder:** `200`

### Criterio 9 — `DELETE` lógico

\`\`\`bash
curl -s -o /dev/null -w "%{http_code}\n" -X DELETE http://localhost:8132/api/suscriptores/1
\`\`\`

**Debe responder:** `204`

Y luego:

\`\`\`bash
docker exec acueducto_bd /opt/mssql-tools18/bin/sqlcmd \
  -S localhost -U sa -P 'Acueducto2026!' -C \
  -Q "SELECT activo FROM bdacueducto.dbo.suscriptor WHERE id_suscriptor = 1"
\`\`\`

**Debe responder:** `0`

### Criterio 11 — El front no se cae con la API apagada

\`\`\`bash
docker compose stop api
\`\`\`

Recargar `http://localhost:8133/suscriptores` en el navegador.

**Debe responder:** la pantalla sigue en pie y muestra un mensaje del tipo
"no se pudo conectar con el servidor".

### Criterio 12 — El front muestra el `422`

En el formulario de creación, dejar `nombre_titular` vacío y enviar.

**Debe responder:** el mensaje del servidor aparece **en la pantalla**, no
en la consola del navegador.

## 3. El recorrido a mano

1. Abrir `http://localhost:8133/suscriptores` y ver cinco filas (no seis).
2. Filtrar por "Comercial" y ver dos.
3. Crear uno nuevo con `AC-007`. Debe aparecer en el listado.
4. Intentar crear otro con `AC-007`. Debe mostrar "ese número ya está en uso".
5. Editar el teléfono de `AC-003`. Debe guardar sin tocar los demás campos.
6. Retirar `AC-001`. Debe desaparecer del listado.
7. Consultar `AC-001` por URL directa. Debe seguir apareciendo, con
   `activo: false`.
8. Apagar la API. Recargar. La pantalla debe seguir en pie.

## 4. Cuando algo no arranca

| Síntoma | Causa probable | Qué hacer |
|---|---|---|
| `bd` no llega a `healthy` | Contraseña de SQL Server no cumple la política | Revisar `MSSQL_SA_PASSWORD` en `docker-compose.yml` |
| La API responde `500` al listar | Falta `using Microsoft.Data.SqlClient;` | Revisar los `using` del repositorio |
| El contenedor cargador corre antes que `bd` | Falta `depends_on: condition: service_healthy` | Agregarlo en `docker-compose.yml` |
| El front carga pero no lista | CORS mal configurado en la API | Revisar `Program.cs` |
| `PATCH` responde `422` | Comparte clase con `PUT` | Revisar `D-v1-1` |

---

## Criterio de cierre

- [x] Una entrada por cada criterio de `2_spec §5`
- [x] Cada comando tiene su salida esperada
- [x] Corre desde cero en una máquina limpia
- [x] Los datos vienen de `DATOS_DE_PRUEBA.md`