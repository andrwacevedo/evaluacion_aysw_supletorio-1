# La base de datos

**`bdacueducto.sql` se le entrega hecho. No lo modifique.**

El diseno no es lo que se evalua en esta evaluacion: lo que se evalua es la
aplicacion que va encima.

## Que trae

| Tabla | Filas | Para que |
|---|---|---|
| `tipo_suscriptor` | 3 | Residencial, comercial y **oficial, que NO se factura** |
| `suscriptor` | 6 | Uno de ellos **retirado** (`AC-005`) |
| `lectura` | 8 | Un suscriptor **sin lectura de julio** y uno con **medidor cambiado** |

## Comprobacion de la Fase 0

```sql
SELECT COUNT(*) FROM tipo_suscriptor;  -- 3
SELECT COUNT(*) FROM suscriptor;       -- 6
SELECT COUNT(*) FROM lectura;          -- 8
```

**Eso es lo que va en el commit de la Fase 0:** los tres numeros, no «cargue
la base».

> **Los datos raros estan puestos a proposito.** El retirado, el que no se
> factura y el del medidor cambiado son los casos con los que se comprueba
> que su API hace lo correcto. Si su listado devuelve 6 suscriptores despues
> de un `DELETE`, algo esta mal.
