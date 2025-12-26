# 🍽️ Food Recipe App

Food Recipe App is a Flutter application developed as part of the requirements for the **[Dicoding “Belajar Membuat Aplikasi Flutter untuk Pemula”](https://www.dicoding.com/academies/159-belajar-membuat-aplikasi-flutter-untuk-pemula)** course.

This project demonstrates fundamental Flutter concepts such as widget composition, navigation, state handling, and basic UI layout following Flutter best practices.

---

## 📱 Features

- Display a list of food recipes
- View recipe details
- Clean and simple UI
- Built using Flutter widgets
- Responsive layout for different screen sizes

---
## 📱 ScreenShot
<img src="https://github.com/AryaGoberto/recipe-app/blob/main/assets/screenshot/1.jpeg" width="300"/>
<img src="https://github.com/AryaGoberto/recipe-app/blob/main/assets/screenshot/2.jpeg" width="300"/>
<img src="https://github.com/AryaGoberto/recipe-app/blob/main/assets/screenshot/3.jpeg" width="300"/>
<img src="https://github.com/AryaGoberto/recipe-app/blob/main/assets/screenshot/4.jpeg" width="300"/>

---
## 🗂️ Project Structure

```text
lib/
├── data/
│   └── recipe_data.dart
├── models/
│   └── recipe.dart
├── pages/
│   ├── detail_page.dart
│   ├── favorite_page.dart
│   ├── notification_page.dart
│   └── recipe_home_page.dart
├── services/
│   └── favorite_manager.dart
├── widgets/
│   ├── detail/
│   │   ├── add_to_cart_button.dart
│   │   ├── circle_icon_button.dart
│   │   ├── creator_section.dart
│   │   ├── header_image.dart
│   │   ├── info_chip.dart
│   │   ├── ingredient_tile.dart
│   │   ├── instruction_tile.dart
│   │   └── related_section.dart
│   ├── segmented_tabs.dart
│   └── home/
│       ├── featured_card.dart
│       ├── icon_badge.dart
│       └── popular_card.dart
└── main.dart
```
## Getting Started
1. Clone this repository
```bash
git clone https://github.com/your-username/food_recipe_app.git
```
2. Navigate to the project directory
```bash
cd food_recipe_app
```
4. Install dependencies
```bash
flutter pub get
```
5. Run the application
```bash
flutter run
```
