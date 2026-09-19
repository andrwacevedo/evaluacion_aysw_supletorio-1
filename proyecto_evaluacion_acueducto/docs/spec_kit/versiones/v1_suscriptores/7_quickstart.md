<!-- ------------------------------------------------------------------
     PLANTILLA · 7_quickstart.md
     Borre este bloque de comentario al terminar de llenarla.

     QUE CONTESTA ....... COMO se levanta y COMO se comprueba que quedo
     SE ALIMENTA DE ..... los criterios de 2_spec, vueltos comandos · DATOS_DE_PRUEBA
     ------------------------------------------------------------------ -->

# Arranque y comprobación — Versión {{N}}

> **Qué es este documento.** Los criterios de aceptación de `2_spec`,
> **convertidos en comandos**. Si un criterio no tiene comando aquí, o el
> criterio está mal escrito o falta la prueba.

---

## 1. Levantar el sistema

```bash
{{el comando único}}
```

| Qué | Dónde |
|---|---|
| {{...}} | {{...}} |

## 2. Las pruebas

{{Una por criterio de aceptación. Cada una con **su salida esperada**, no solo
el comando.}}

### {{Criterio n}}

```bash
{{comando}}
```

**Debe responder:**

```
{{salida esperada, literal}}
```

## 3. El recorrido a mano

{{Lo que hay que hacer una vez con el navegador, porque no todo se comprueba
con un comando.}}

## 4. Cuando algo no arranca

| Síntoma | Causa probable | Qué hacer |
|---|---|---|
| {{...}} | {{...}} | {{...}} |

---

## Criterio de cierre

- [ ] **Una entrada por cada criterio** de `2_spec` §5
- [ ] Cada comando tiene su **salida esperada**, no solo el comando
- [ ] Corre **desde cero** en una máquina limpia
- [ ] Los datos que usa vienen de `DATOS_DE_PRUEBA`, no inventados aquí

## Errores típicos

| Error | Cómo se ve |
|---|---|
| Comando sin salida esperada | Nadie sabe si pasó |
| Prueba que solo corre en la máquina de quien la escribió | Rutas absolutas, puertos ocupados |
| Criterios de `2_spec` sin prueba | La versión se cierra sin comprobar |
