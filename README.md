# 📱 Personal Portfolio App — Flutter

A polished personal portfolio mobile application built with Flutter, featuring a dark theme with electric-indigo accents.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ≥ 3.0.0 ([Install Flutter](https://docs.flutter.dev/get-started/install))
- Dart SDK ≥ 3.0.0 (bundled with Flutter)
- Android Studio / VS Code with Flutter plugin
- Android emulator or physical device

### Setup & Run

```bash
# 1. Navigate to the project folder
cd portfolio_app

# 2. Get dependencies
flutter pub get

# 3. Run on connected device/emulator
flutter run

# 4. Build release APK
flutter build apk --release
```

### Demo Login
```
Email:    demo@portfolio.com
Password: password
```

---

## 🗂️ Project Structure

```
lib/
├── main.dart                 # App entry point
├── theme/
│   └── app_theme.dart        # Colors, typography, ThemeData
├── models/
│   └── portfolio_data.dart   # All portfolio content & data models
├── widgets/
│   └── shared_widgets.dart   # Reusable UI components
└── screens/
    ├── login_screen.dart     # Authentication UI
    ├── main_shell.dart       # Bottom navigation shell
    ├── home_screen.dart      # Welcome & intro
    ├── profile_screen.dart   # About / Skills / Experience tabs
    ├── projects_screen.dart  # Filterable projects grid
    └── contact_screen.dart   # Contact info & message form
```

---

## 📸 Screens

| Screen | Description |
|--------|-------------|
| **Login** | Email + password auth with animated entrance, demo credentials hint |
| **Home** | Hero section with name/title, stats (years/projects/clients), quick-nav cards |
| **Profile** | Tabbed: About (bio, personal details), Skills (animated progress bars by category), Experience (timeline cards) |
| **Projects** | Category filter chips, featured project banner, tappable cards with detail bottom sheet |
| **Contact** | Direct contact tiles (copy-to-clipboard), social links grid, message form with success state |

---

## 🎨 Design Decisions

- **Palette**: Deep navy-black `#0A0E1A` background with electric indigo `#6C63FF` as the signature accent — calm but confident, code-adjacent without being sterile.
- **Type**: Space Grotesk (display/headings) + Inter (body/labels) — technically precise yet approachable.
- **Signature element**: Gradient text headings on a dark canvas with glowing ambient blobs — immersive but understated.
- **Motion**: Entrance fade+slide animations, animated skill bars, smooth tab transitions. No animation for decoration's sake.

---

## 🛠️ Customization

Edit `lib/models/portfolio_data.dart` to replace all portfolio content:
- Personal details (name, title, bio, location)
- Skills with proficiency levels
- Work experience timeline
- Projects (title, description, tech stack, links, stats)
- Contact info and social links

---

## 📦 Dependencies

| Package | Purpose |
|---------|---------|
| `google_fonts` | Space Grotesk + Inter typefaces |
| `url_launcher` | Open URLs, email, phone links |
| `font_awesome_flutter` | Extended icon set |
| `animated_text_kit` | Text animation effects |
| `flutter_animate` | Declarative animations |
