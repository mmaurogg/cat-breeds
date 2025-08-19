# CatBreeds App

CatBreeds es una aplicación desarrollada en Flutter que permite explorar diferentes razas de gatos, ver detalles de cada raza y realizar búsquedas. La aplicación utiliza una arquitectura limpia con separación de capas (`data`, `domain`, `presentation`) y sigue buenas prácticas de desarrollo.

---

## **Características**
- Listado de razas de gatos.
- Detalles de cada raza, incluyendo descripción, temperamento, origen y más.
- Búsqueda de razas de gatos.
- Pantalla de splash personalizada.
- Navegación dinámica utilizando `go_router`.

---

## **Estructura del Proyecto**
El proyecto está organizado en las siguientes capas:

### **1. Configuración**
- `lib/config/`: Contiene configuraciones globales como rutas (`routes.dart`).

### **2. Presentación**
- `lib/presentation/UI/`: Contiene los widgets y páginas de la interfaz de usuario.
- `lib/presentation/providers/`: Contiene los `Providers` para manejar el estado de la aplicación.

### **3. Dominio**
- `lib/domain/entities/`: Contiene las entidades puras que representan los datos en la lógica de negocio.
- `lib/domain/usecases/`: Contiene los casos de uso que encapsulan la lógica de negocio.

### **4. Datos**
- `lib/data/models/`: Contiene los modelos que interactúan con la API y manejan la serialización/deserialización.
- `lib/data/repositories/`: Contiene los repositorios que manejan la obtención de datos.

---

## **Tecnologías Utilizadas**
- **Flutter**: Framework para el desarrollo de aplicaciones multiplataforma.
- **Riverpod**: Manejo de estado reactivo.
- **GoRouter**: Navegación declarativa.
- **Freezed**: Generación de clases inmutables.
- **JsonAnnotation**: Serialización y deserialización de datos JSON.
- **Flutter Native Splash**: Pantalla de splash personalizada.

---

## **Instalación**
1. Clona el repositorio: `git clone https://github.com/tu-usuario/catbreeds.git`
2. Navega al directorio del proyecto: `cd catbreeds`
3. Instala las dependencias: `flutter pub get`

## **Ejecución**
1. Limpia el proyecto: `flutter clean`
2. Ejecuta la aplicación: `flutter run`