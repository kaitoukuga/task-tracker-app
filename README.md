# 📝 Task Tracker App

A simple, clean, and functional task management mobile app built with **Flutter** and using **Hive** as a local NoSQL database.
Developed as part of an assessment to demonstrate skills in planning, mobile development, clean architecture, and documentation.

---

## 🚀 Features

### ✅ Core Features

* Add new tasks
* Edit existing tasks
* Delete tasks
* Mark tasks as **done / not done**
* Persist all task data using **Hive local storage**
* Tasks remain saved even after restarting the app

### 🎨 UI/UX

* Clean, modern UI using Flutter Material 3
* Card-based task list layout
* Bottom sheet for task actions (Edit / Delete)

---

## 🏗️ Tech Stack

* **Flutter** (Dart)
* **Hive** (Local NoSQL Database)
* **Hive Generator + Build Runner**
* **Material 3 Design**

---

## 📦 Project Structure

```
lib/
 ├── main.dart
 ├── models/
 │     └── task.dart
 ├── services/
 │     └── task_service.dart
 ├── screens/
 │     ├── home_screen.dart
 │     └── add_task_screen.dart
```

---

## 🗂️ Model (Task)

Each task consists of:

* **title**: String
* **description**: String
* **isDone**: bool (persisted in Hive)

Stored in Hive box:

```
tasks
```

---

## 💾 Local Storage (Hive)

The app uses Hive for:

* Adding tasks
* Updating tasks
* Deleting tasks
* Persisting done/not-done status

Hive boxes are initialized at app startup.

---

## ▶️ How to Run the App

1. Clone the repository:

```
git clone <your_repo_url>
```

2. Install dependencies:

```
flutter pub get
```

3. Generate Hive type adapters:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app:

```
flutter run
```

---

## 🧪 Tested Scenarios

* Add → Restart → Task persists
* Edit → Restart → Task persists
* Delete → Restart → Item removed
* Toggle Done → Restart → Status persists

---

## 📝 Future Improvements

* Add task categories
* Add deadlines/date picker
* Add search/filter
* Add archived tasks
* Add light/dark mode toggle
* Cloud sync (Firebase)

---

## 📚 Assessment Notes

This project demonstrates:

* Mobile development fundamentals
* State management using StatefulWidget
* Local database integration
* CRUD architecture
* Clean coding practices
* Proper documentation and project planning

---

## 👤 Developer

**Fikri Saragih**  
Junior Developer

---

Thank you! 🚀  
Happy coding!
