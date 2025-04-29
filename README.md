# 📝 Blog App

A modern Flutter blog application powered by Supabase for backend and Firebase-style simplicity. This app includes full **authentication**, **blog creation**, and **blog listing** functionality.

---

## 🚀 Features

- 🔐 **Authentication** – User registration and login using Supabase
- 📝 **Create Blog** – Add blog posts with a title, content, and image
- 📄 **Display Blogs** – List all blog posts with their content and images
- 📷 **Image Picker** – Choose images from the device gallery
- 🧠 **State Management** – Powered by `flutter_bloc` and `fpdart` for functional error handling
- 💉 **Dependency Injection** – Using `get_it` for service management
- 🍃 **Fully typed, clean architecture** – Separation of concerns and scalable structure

---

## 📦 Packages Used

| Package | Description |
|--------|-------------|
| [`fpdart`](https://pub.dev/packages/fpdart) | Functional programming utilities for error handling (`Either`, `Option`, etc.) |
| [`supabase`](https://pub.dev/packages/supabase) | Backend as a service for database, auth, and storage |
| [`supabase_flutter`](https://pub.dev/packages/supabase_flutter) | Flutter support for Supabase |
| [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | Reactive state management using BLoC pattern |
| [`get_it`](https://pub.dev/packages/get_it) | Simple service locator for dependency injection |
| [`loading_animation_widget`](https://pub.dev/packages/loading_animation_widget) | Beautiful loading animations |
| [`another_flushbar`](https://pub.dev/packages/another_flushbar) | Customizable toast and snackbar notifications |
| [`image_picker`](https://pub.dev/packages/image_picker) | Pick images from device gallery or camera |
| [`uuid`](https://pub.dev/packages/uuid) | Generate unique identifiers for blogs |

---

## 🧱 Project Structure

lib/ ├── core/ # Common utilities, themes, and error handling ├── features/ │ ├── auth/ # Authentication logic (login/register) │ ├── blog/ # Blog feature: create, fetch, display │ └── shared/ # Shared UI widgets and styles ├── main.dart # Entry point

## 🛠️ Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/blog-app.git
   cd blog-app
2.  **Install dependencies**:
    ```bash
    flutter pub get
3.  **Run the App**:
    ```bash
    flutter run
## 🧪 Coming Soon
  ✏️ Edit and delete blogs

  🔍 Blog search functionality

  🧑‍🤝‍🧑 User profiles

  💬 Comments and likes

##💬 Feedback
Feel free to open issues or pull requests. If you like the project, a ⭐️ would be appreciated!



