# 🧩 Personalización de Interfaces en Flutter

Este proyecto demuestra la **creación y aplicación de un tema personalizado reutilizable en Flutter**, implementado bajo la metodología **Atomic Design**.  
El tema se aplica en dos pantallas principales: **Login** y **Perfil**, asegurando una identidad visual coherente, moderna y profesional en toda la aplicación.

---

## 📱 Características principales

- 🎨 Implementación de un **tema global (`ThemeData`)** con colores, tipografía y estilos definidos.  
- 🌗 Soporte para **modo claro y oscuro** (ampliable).  
- 🧱 Uso de la **metodología Atomic Design** para estructurar los componentes visuales.  
- 🔐 Pantalla de **Login** con componentes estilizados (botones, textos y formularios).  
- 👤 Pantalla de **Perfil** con `AppBar`, `Cards` y secciones organizadas de usuario.  
- ♻️ Diseño modular, reutilizable y fácil de mantener.

---


## 🏗️ Estructura del proyecto

```
lib/
├── core/
│   └── theme/
│       ├── app_theme.dart          # Definición de los temas claro y oscuro
│       └── theme_manager.dart      # Gestión dinámica del tema
│
├── presentation/
│   ├── pages/
│   │   ├── login_page.dart         # Página de inicio de sesión
│   │   └── profile_page.dart       # Página de perfil
│   ├── widgets/
│   │   ├── custom_text_field.dart  # Campo de texto reutilizable
│   │   └── primary_button.dart     # Botón principal estilizado
│   └── components/
│       └── theme_toggle.dart       # Interruptor de tema (opcional)
│
└── main.dart                       # Punto de entrada principal
```

---

## 💡 Descripción del diseño

El sistema de temas fue diseñado con `ThemeData`, definiendo una **paleta de colores principal**, tipografías y estilos globales para todos los widgets.  
Los componentes visuales se estructuraron siguiendo los principios de **Atomic Design**, lo que permite una mayor **reutilización, mantenibilidad y coherencia** en toda la aplicación.  

Ejemplo del uso del tema en el *Login*:
```dart
color: Theme.of(context).colorScheme.primary,
style: Theme.of(context).textTheme.displayMedium,
```

Ejemplo del uso del tema en el *Perfil*:
```dart
AppBar(
  title: const Text('Mi Perfil'),
  backgroundColor: Theme.of(context).colorScheme.primary,
)
```

---

## 🧭 Metodología aplicada

- **Atomic Design:** División jerárquica de la interfaz en componentes reutilizables.  
- **Theming:** Configuración centralizada de estilos mediante `ThemeData`.  
- **UX/UI Design:** Enfoque en consistencia visual y experiencia del usuario.

---

## 📚 Referencias

- Google. (2024). *Flutter: Material design theming*. Flutter Documentation.  
  https://docs.flutter.dev/ui/design/material  
- Frost, B. (2016). *Atomic Design*. CreateSpace Independent Publishing Platform.  
  https://bradfrost.com/blog/post/atomic-web-design/  
- Nielsen, J., & Budiu, R. (2020). *Mobile Usability*. New Riders.  
  https://www.nngroup.com/books/mobile-usability/

---

## 🧠 Licencia

Este proyecto fue desarrollado con fines **académicos y demostrativos**.  
Puede ser reutilizado con fines educativos citando la fuente correspondiente.
