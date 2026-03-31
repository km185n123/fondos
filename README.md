# Fondos - Gestión de Inversiones (Prueba Técnica)

Aplicación móvil desarrollada en Flutter para la gestión de fondos de inversión (FPV/FIC). Permite a los usuarios visualizar fondos disponibles, suscribirse con validaciones de saldo y monto mínimo, cancelar participaciones y revisar su historial de transacciones.

## 🏗️ Patrones de Arquitectura Usados

El proyecto está construido bajo estrictos estándares profesionales, separando las responsabilidades para garantizar un código escalable y mantenible:

* **Clean Architecture:** Separación clara en tres capas principales (`Presentation`, `Domain`, `Data`).
* **Patrón Repositorio:** Centraliza el acceso a los datos, decidiendo si consumir la información de la base de datos local o de la API simulada (estrategia Offline-First).
* **Patrón BLoC (Business Logic Component):** Utilizado para el manejo de estado en la capa de presentación, separando la UI de la lógica de negocio.

## 🛠️ Herramientas y Librerías Principales

* **Flutter / Dart:** Framework principal multiplataforma.
* **BLoC (`flutter_bloc`):** Manejo de estados reactivos.
* **GetIt & Injectable (`get_it`, `injectable`):** Inyección de dependencias para desacoplar las capas del proyecto.
* **Freezed & JSON Serializable (`freezed`, `json_serializable`):** Generación de código para inmutabilidad de datos (Entidades, DTOs y Estados de BLoC).
* **Dio (`dio`):** Cliente HTTP para el consumo de la API REST simulada (incluye manejo de interceptores).
* **Drift (`drift`):** Persistencia de base de datos local (SQLite).

## 🔐 Seguridad

Para cumplir con los más altos estándares de protección de datos financieros simulados:
* **Base de Datos Cifrada:** Se utiliza **SQLCipher** integrado con Drift para encriptar la base de datos local.
* **Almacenamiento Seguro de Llaves:** La clave criptográfica para abrir la base de datos se genera de forma segura y se almacena utilizando **Flutter Secure Storage** (Android Keystore en Android y Keychain en iOS).

## 🚀 Cómo correr el proyecto

### Prerrequisitos
1. Tener [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.

### Pasos de ejecución

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/km185n123/fondos.git
   cd fondos
