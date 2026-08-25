# SETUP.md — Puesta en marcha en GitHub

Tiempo total: **15 minutos**. Al terminar tendrás el repo publicado, 5 milestones, 21 issues con fecha y un tablero de seguimiento.

---

## 1. Requisitos

```bash
# Git y GitHub CLI
git --version
gh --version        # si no lo tienes: https://cli.github.com/

# Autenticarte (abre el navegador)
gh auth login
```

---

## 2. Crear el repositorio y subir todo

Descomprime el proyecto, entra en la carpeta y ejecuta:

```bash
cd bitacora-tecnica

git init -b main
git add .
git commit -m "chore: estructura inicial del plan formativo 2026/2027"

# Crea el repo en tu cuenta y sube el contenido de golpe
gh repo create bitacora-tecnica --public --source=. --remote=origin --push
```

> Si lo prefieres privado, cambia `--public` por `--private`. Recomendación: **público**. Este repo es parte de tu portfolio, y un historial de commits constante durante un año dice más de ti que cualquier certificado.

---

## 3. Generar milestones e issues automáticamente

```bash
./scripts/crear-hitos.sh
```

El script crea, sin que tengas que tocar nada:

- **8 etiquetas** — `via-a`, `via-b`, `via-c`, `via-d`, `libro`, `proyecto`, `certificacion`, `cierre`
- **5 milestones** con su fecha de vencimiento — Fase 0, T1, T2, T3, Verano
- **21 issues**, uno por hito del calendario, cada uno con su fecha límite, lo que hay que saber, el tangible y su checklist

Si algo falla, es casi siempre que `gh auth login` no se completó. Se puede volver a ejecutar sin problema.

---

## 4. Crear el tablero de seguimiento

```bash
gh project create --owner "@me" --title "Roadmap 2026/2027"
```

Después, en la web del proyecto:

1. **Añadir los issues:** botón `+` → *Add item from repository* → selecciona `bitacora-tecnica` → añade todos.
2. **Crear los campos:**
   - `Fecha límite` (tipo Date)
   - `Horas estimadas` (tipo Number)
   - `Vía` (tipo Single select: A / B / C / D)
3. **Crear 3 vistas:**

| Vista | Tipo | Configuración |
|---|---|---|
| **Ahora** | Board | Agrupar por Status. Filtro: `milestone:"Fase 0 — Arranque"` |
| **Calendario** | Roadmap | Campo de fecha: `Fecha límite` |
| **Por vía** | Table | Agrupar por `Vía`, ordenar por `Fecha límite` |

La vista **Ahora** es la única que miras a diario. Las otras dos son para la revisión del domingo.

---

## 5. Rutina diaria y semanal

**Al terminar cada bloque técnico:**

```bash
git add .
git commit -m "notas: <tema de hoy>"
git push
```

**Cada domingo (20 min):**

```bash
# 1. Crear la entrada de la semana
cp bitacora/_plantilla-semanal.md bitacora/$(date +%G-W%V).md

# 2. Rellenarla, actualizar la tabla de progreso del README
#    y cerrar en GitHub los issues completados
gh issue list --state open --milestone "Trimestre 1"
gh issue close <número> --comment "Tangible: <enlace al commit o repo>"

git add .
git commit -m "bitacora: semana $(date +%G-W%V)"
git push
```

---

## 6. Convención de commits

Mantenerla hace que el historial sea legible a un año vista:

| Prefijo | Para qué |
|---|---|
| `notas:` | Apuntes de un tema |
| `libro:` | Avance o cierre de una lectura |
| `lab:` | Ejercicios y prácticas |
| `proyecto:` | Trabajo en un entregable |
| `bitacora:` | Registro semanal |
| `plan:` | Cambios en el propio plan |

---

## 7. Detalle opcional: gráfico de progreso

Cuando lleves un par de meses, en la vista **Insights** del Project tendrás automáticamente la gráfica de issues cerrados por semana. Es la mejor señal de si el ritmo de 9-10 h se está sosteniendo o no.
