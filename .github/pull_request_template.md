TL;DR → Aquí tienes un **template reutilizable de PR** listo para copiar y usar en todas tus HUs.

---

## 📌 PR: [ID HU] – [Título corto]

### 🧾 Descripción

Describe brevemente qué resuelve este PR y el objetivo de la HU.

---

## 🏗️ Cambios principales

### 1. Configuración / Base

* [ ] Estructura creada/actualizada
* [ ] Dependencias agregadas/modificadas

### 2. Modelado de datos

* Entidades:

  * `[NombreEntidad]`
* DTOs:

  * `[NombreDTO]`
* Tablas DB:

  * `[tabla]`

### 3. Base de datos

* [ ] DAO implementado
* [ ] Operaciones:

  * [ ] Insert
  * [ ] Query
  * [ ] Sync

### 4. API / Servicios

* Endpoint(s):

  * `GET /...`
* Servicio:

  * `[ServiceName]`
* Manejo de errores: [sí/no]

### 5. Repositorio

* Interface:

  * `[Repository]`
* Implementación:

  * `[RepositoryImpl]`
* Flujo:

  ```
  API → DB → UI
  ```

### 6. Estado (BLoC / Provider / etc.)

* Estado(s):

  * [ ] Loading
  * [ ] Success
  * [ ] Error
* Manejo de retry: [sí/no]

### 7. Inyección de dependencias

* [ ] Registrado en `get_it`
* [ ] Configurado con `injectable`

### 8. UI

* Pantallas:

  * `[PageName]`
* Componentes:

  * `[Widget1, Widget2]`
* Estados UI:

  * [ ] Loading
  * [ ] Error
  * [ ] Data

### 9. Testing (opcional)

* [ ] Unit tests
* [ ] Bloc tests
* [ ] Widget tests

---

## 🔗 Tareas relacionadas

* [SCRUM-XXX]
* [SCRUM-XXX]

Base URL:

```
https://prueba-fondos.atlassian.net/browse/
```

---

## 🧪 Cómo probar

```bash
flutter pub get
flutter run
```

API mock:

```bash
json-server --watch db.json
```

Validar:

* [ ] Flujo principal
* [ ] Manejo de errores
* [ ] Persistencia

---

## ⚠️ Notas

* Consideraciones técnicas relevantes
* Limitaciones conocidas

---

## ✅ Checklist

* [ ] Código limpio
* [ ] Arquitectura respetada
* [ ] Manejo de errores
* [ ] UI validada
* [ ] Tests (si aplica)

---

## 🚀 Impacto

* Qué mejora / habilita este PR

---


