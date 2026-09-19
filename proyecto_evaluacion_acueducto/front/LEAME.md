# El front — Fase 6

**La tecnologia, la que usted quiera.** HTML con `fetch` es suficiente y es lo
mas rapido.

**Se revisan cuatro cosas:**

| | |
|---|---|
| 1 | **Lista** los suscriptores |
| 2 | **Crea** uno |
| 3 | **Muestra el error del 422 en la pantalla** — no en la consola del navegador |
| 4 | **No se cae con la API apagada**: dice «no se pudo conectar» y sigue en pie |

> **La 3 y la 4 son las que se olvidan, y son las que valen.** Un front que
> solo funciona cuando todo va bien no prueba nada: el caso feliz nunca da
> problemas.
>
> **La 4 tiene una forma de comprobarse que no admite trampa:** apague la API
> con `docker compose stop api`, **deje la base encendida**, y recargue. Si
> siguen apareciendo filas, su front esta llegando a la base por su cuenta y
> las capas del SISTEMA estan rotas.

La API queda en `http://localhost:8132`.
