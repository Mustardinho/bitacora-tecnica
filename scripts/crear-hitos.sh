#!/usr/bin/env bash
#
# crear-hitos.sh — Crea en GitHub las etiquetas, los milestones y los 20 issues
# del plan formativo 2026/2027.
#
# Requisitos: GitHub CLI (gh) instalado y autenticado -> gh auth login
# Uso:        ./scripts/crear-hitos.sh
#
# Es seguro ejecutarlo dentro del repositorio ya clonado: detecta el repo solo.

set -euo pipefail

REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
echo "==> Repositorio detectado: $REPO"
echo

# ---------------------------------------------------------------- ETIQUETAS
echo "==> Creando etiquetas..."
crear_label() {
  gh label create "$1" --color "$2" --description "$3" --force >/dev/null 2>&1 || true
  echo "    · $1"
}
crear_label "via-a"         "1f6feb" "Fundamentos de desarrollo"
crear_label "via-b"         "2da44e" "APIs (diseño y seguridad)"
crear_label "via-c"         "8250df" "Arquitectura y diseño de software"
crear_label "via-d"         "bf8700" "Agile y DevOps"
crear_label "libro"         "d4a72c" "Lectura de la biblioteca"
crear_label "proyecto"      "cf222e" "Entregable de código"
crear_label "certificacion" "0969da" "Certificación oficial"
crear_label "cierre"        "6e7781" "Cierre de trimestre"
echo

# ---------------------------------------------------------------- MILESTONES
echo "==> Creando milestones..."
crear_milestone() {
  gh api "repos/$REPO/milestones" -f title="$1" -f due_on="$2" -f description="$3" >/dev/null 2>&1 \
    && echo "    · $1" \
    || echo "    · $1 (ya existía)"
}
crear_milestone "Fase 0 — Arranque"  "2026-09-13T22:59:59Z" "25 ago -> 13 sep 2026. Sin clases: 2 h/dia."
crear_milestone "Trimestre 1"        "2026-12-18T22:59:59Z" "14 sep -> 18 dic 2026. 9-10 h/semana."
crear_milestone "Trimestre 2"        "2027-03-27T22:59:59Z" "7 ene -> 27 mar 2027. 9-10 h/semana."
crear_milestone "Trimestre 3"        "2027-06-19T22:59:59Z" "abr -> 19 jun 2027. Carga reducida por FCT."
crear_milestone "Verano 2027"        "2027-08-31T22:59:59Z" "jul -> 31 ago 2027. ~120 h."
echo

# ---------------------------------------------------------------- ISSUES
echo "==> Creando issues..."
crear_issue() {
  local titulo="$1" milestone="$2" labels="$3" fecha="$4" aprender="$5" tangible="$6"
  gh issue create \
    --title "$titulo" \
    --milestone "$milestone" \
    --label "$labels" \
    --body "$(printf '**Fecha límite:** %s\n\n## Qué hay que saber\n\n%s\n\n## Tangible que lo demuestra\n\n%s\n\n---\n\n### Checklist\n\n- [ ] Material estudiado\n- [ ] Notas en `notas/`\n- [ ] Tangible entregado y enlazado\n- [ ] Progreso actualizado en README\n' "$fecha" "$aprender" "$tangible")" \
    >/dev/null && echo "    · $titulo"
}

# --- Fase 0
crear_issue "Montar el repositorio de bitácora" "Fase 0 — Arranque" "via-a" "31 ago 2026" \
  "Estructura de un repositorio de conocimiento versionado." \
  "Repo \`bitacora-tecnica\` creado, con README, estructura de notas y el plan versionado."

crear_issue "Git avanzado + Regex" "Fase 0 — Arranque" "via-a,via-b" "6 sep 2026" \
  "Rebase, cherry-pick, resolución de conflictos, flujo de ramas. Expresiones regulares." \
  "Learn Git Branching completo (todos los niveles) + 50 ejercicios de regex101 resueltos y guardados en \`notas/regex.md\`."

crear_issue "Certificación Postman Student Expert" "Fase 0 — Arranque" "via-b,certificacion" "13 sep 2026" \
  "Postman avanzado: colecciones, entornos, variables, tests, mocks." \
  "Certificación obtenida + colección pública de una API real documentada."

# --- Trimestre 1
crear_issue "HTTP a fondo + Roadmap API Design (60%)" "Trimestre 1" "via-b,proyecto" "30 sep 2026" \
  "MDN HTTP completo: cabeceras, cacheo, CORS, códigos de estado. Diseño REST." \
  "API REST propia con 3 endpoints CRUD, desplegada y documentada con OpenAPI."

crear_issue "Libro 1 — El Programador Pragmático" "Trimestre 1" "libro" "15 oct 2026" \
  "Lectura completa del libro." \
  "2 páginas de notas en el repo + 5 prácticas del libro aplicadas a código propio, con commits que lo demuestren."

crear_issue "SQL real — SQLBolt + PostgreSQL Exercises" "Trimestre 1" "via-a" "31 oct 2026" \
  "Joins, subconsultas, window functions, normalización." \
  "60 consultas resueltas + esquema relacional propio normalizado a 3FN con datos de prueba."

crear_issue "Libro 2 — The Phoenix Project + Agile de fuente original" "Trimestre 1" "libro,via-d" "15 nov 2026" \
  "The Phoenix Project, Scrum Guide y Kanban Guide." \
  "Tablero real funcionando con sprints de 2 semanas sobre proyectos propios: 2 sprints ya cerrados."

crear_issue "CS50x — semanas 0 a 5" "Trimestre 1" "via-a" "30 nov 2026" \
  "C, gestión de memoria, algoritmos, complejidad, estructuras de datos." \
  "6 problem sets entregados y aprobados."

crear_issue "Advent of Code 2026" "Trimestre 1" "via-a,proyecto" "25 dic 2026" \
  "Resolución algorítmica bajo restricción de tiempo." \
  "Mínimo 15/25 días resueltos, repo público con README explicando el enfoque de cada uno."

crear_issue "CIERRE T1 — Backend RealWorld v1" "Trimestre 1" "via-c,proyecto,cierre" "18 dic 2026" \
  "Arquitectura de una API completa según especificación externa." \
  "Backend RealWorld: auth con JWT, CRUD completo, tests de integración."

# --- Trimestre 2
crear_issue "OWASP API Top 10 + PortSwigger" "Trimestre 2" "via-b" "20 ene 2027" \
  "OWASP API Security Top 10, autenticación rota, JWT, IDOR." \
  "20 labs completados + informe de 1 página por cada vulnerabilidad explotada en Juice Shop."

crear_issue "Roadmap API Security completo" "Trimestre 2" "via-b,proyecto" "31 ene 2027" \
  "Todos los nodos del roadmap de seguridad de APIs." \
  "Checklist de seguridad propia APLICADA a la API: rate limiting, CORS, validación de entrada, rotación de tokens."

crear_issue "Libros 3 y 4 — Hábitos Atómicos + A Philosophy of Software Design" "Trimestre 2" "libro,via-c" "15 feb 2027" \
  "Sistemas personales. Complejidad y abstracción en el diseño de software." \
  "Refactor documentado del módulo más complejo, con métrica antes/después: líneas, complejidad ciclomática, nº de dependencias."

crear_issue "Patrones de diseño" "Trimestre 2" "via-c,proyecto" "28 feb 2027" \
  "Catálogo de refactoring.guru y patterns.dev." \
  "10 patrones implementados en un repo, cada uno con su test y un README de 'cuándo usarlo y cuándo no'."

crear_issue "Libro 5 — Entiende los Algoritmos + Exercism" "Trimestre 2" "libro,via-a" "15 mar 2027" \
  "Algoritmos y estructuras de datos fundamentales." \
  "100 ejercicios de Exercism resueltos. (Fallas 16-19 mar: sin carga.)"

crear_issue "CIERRE T2 — App RealWorld completa" "Trimestre 2" "via-c,proyecto,cierre" "27 mar 2027" \
  "Integración frontend-backend y despliegue." \
  "App RealWorld completa: frontend conectado, desplegada y con URL pública."

# --- Trimestre 3
crear_issue "Docker" "Trimestre 3" "via-d,proyecto" "17 abr 2027" \
  "Imágenes, volúmenes, redes, docker-compose." \
  "Todos los proyectos dockerizados + un docker-compose que levanta el stack entero con un comando."

crear_issue "CI/CD con GitHub Actions" "Trimestre 3" "via-d,proyecto" "8 may 2027" \
  "Pipelines: tests, build, deploy automático." \
  "Pipeline verde en 2 repos: tests -> build -> deploy automático."

crear_issue "Libros 6 y 7 — Código Limpio + Head First Patrones" "Trimestre 3" "libro,proyecto" "29 may 2027" \
  "Código limpio con espíritu crítico. Patrones aplicados." \
  "Proyecto final de DAW con cobertura de tests superior al 60%."

crear_issue "Diseño de sistemas y documentación de arquitectura" "Trimestre 3" "via-c,cierre" "19 jun 2027" \
  "System Design Primer: escalabilidad, caching, colas, balanceo. Modelo C4 y ADRs." \
  "Documento de arquitectura del proyecto: diagrama C4 + 5 ADRs con decisiones justificadas."

# --- Verano
crear_issue "Full Stack Open partes 0-7" "Verano 2027" "via-a,certificacion" "31 jul 2027" \
  "React, Node, testing, estado, routing." \
  "Certificado de Full Stack Open partes 0-7 (créditos ECTS reconocidos)."

crear_issue "TypeScript + Libros 8 y 9 + Portfolio" "Verano 2027" "via-a,libro,proyecto" "31 ago 2027" \
  "TypeScript. Refactoring (Fowler) y Arquitectura Limpia." \
  "Portfolio online con 3 proyectos y 10 artículos escritos."

echo
echo "==> Listo. Revisa: https://github.com/$REPO/issues"
echo "==> Siguiente paso: crear el Project 'Roadmap 2026/2027' y añadir todos los issues."
