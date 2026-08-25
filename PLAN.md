# PLAN.md — Las cuatro vías

El plan avanza en **4 vías paralelas** a distinto ritmo, no en fases secuenciales. Así nunca hay un periodo de solo teoría ni de solo código.

**Foco del curso:** desarrollo, arquitectura y APIs. n8n y GoHighLevel quedan fuera del plan formativo (se cubren en el trabajo diario).

---

## VÍA A — Fundamentos de desarrollo

> Objetivo: cerrar los huecos que el ciclo no cubre y que en primero de carrera se dan por sabidos.

**Bloques:**
1. **Fundamentos de CS** — C, gestión de memoria, complejidad algorítmica, estructuras de datos (CS50x, semanas 0-5).
2. **JavaScript profundo** — el lenguaje de verdad, no el de los tutoriales (javascript.info).
3. **SQL real** — joins, subconsultas, window functions, normalización (SQLBolt + PostgreSQL Exercises).
4. **Git avanzado** — rebase, cherry-pick, resolución de conflictos, flujo de ramas (Learn Git Branching).
5. **Full Stack Open** — React, Node, TypeScript, testing, Docker, CI/CD. Bloque de verano.

**Carga estimada:** ~105 h

---

## VÍA B — APIs

> Objetivo: dominio de diseño y seguridad de APIs, con los dos roadmaps de roadmap.sh como columna vertebral.

**Bloques:**
1. **HTTP a fondo** — cabeceras, cacheo, CORS, códigos de estado, métodos idempotentes (MDN).
2. **Diseño de APIs** — REST, versionado, paginación, contratos, OpenAPI (`roadmap.sh/api-design`).
3. **Herramienta** — Postman a nivel avanzado: colecciones, entornos, tests, mocks. Certificación Student Expert.
4. **Regex y manipulación de datos** — el 80% del trabajo de integración es transformar datos.
5. **Seguridad de APIs** — OWASP API Top 10, OAuth2/JWT, IDOR, rate limiting (`roadmap.sh/api-security` + PortSwigger).

**Carga estimada:** ~50 h

---

## VÍA C — Arquitectura y diseño de software

> Objetivo: dejar de escribir código que funciona y empezar a escribir código que se puede mantener.

**Bloques:**
1. **Complejidad y abstracción** — qué hace complejo a un sistema (Ousterhout).
2. **Patrones de diseño** — catálogo, y sobre todo cuándo NO aplicarlos (refactoring.guru, patterns.dev).
3. **Refactorización** — catálogo de refactorizaciones con red de tests (Fowler).
4. **Diseño de sistemas** — escalabilidad, caching, colas, balanceo (system-design-primer).
5. **Documentación de arquitectura** — diagramas C4 y ADRs (Architecture Decision Records).

**Carga estimada:** ~100 h (incluye el proyecto RealWorld)

---

## VÍA D — Agile, DevOps y trabajo en equipo

> Objetivo: entender por qué se organiza así el trabajo. Encaja directamente con el módulo de Despliegue de 2º DAW.

**Bloques:**
1. **Agile de fuente original** — Scrum Guide y Kanban Guide, no resúmenes de terceros.
2. **Cultura DevOps** — cuellos de botella, flujo, teoría de restricciones (*The Phoenix Project* → *The DevOps Handbook*).
3. **Docker** — imágenes, volúmenes, redes, docker-compose.
4. **CI/CD** — GitHub Actions: tests → build → deploy automático.

**Carga estimada:** ~35 h

---

## Extensiones opcionales

Si el ritmo lo permite, en este orden de prioridad:

1. **TypeScript** — paso natural tras JS, muy demandado.
2. **Testing / TDD** (Vitest, Jest) — el mayor diferenciador de un perfil junior.
3. **Linux y línea de comandos** — *The Missing Semester of Your CS Education* (MIT).
4. **Matemática discreta y estructuras de datos** — si hay universidad, adelantar esto ahorra un semestre.
5. **Inglés técnico** — leer los libros en inglés siempre que se pueda.
6. **Backend PHP/Symfony** — si es el stack que se consolida en el trabajo.
