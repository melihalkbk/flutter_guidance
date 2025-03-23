# Flutter Guidance

Flutter Guidance is a comprehensive learning companion app designed to help developers master Flutter UI development through interactive examples, practical tips, and well-organized widget documentation.
<img src=https://github.com/melihalkbk/flutter_guidance/blob/main/flutter_guidance/assets/flutter_guidance_banner.jpeg />
<p>
This educational project aims to make Flutter development more accessible and enjoyable for developers at all skill levels. By providing interactive examples and clear explanations, Flutter Guidance bridges the gap between documentation and practical implementation.
</p>

<p>
The app is structured to provide an intuitive learning experience, guiding users from basic UI components to complex widget implementations and best practices for Flutter development.
</p>

## 🔆 Overall Look'n Feel

Click image to watch the video 

[![Watch the demo](https://img.youtube.com/vi/nC5Lo_rANus/0.jpg)](https://www.youtube.com/watch?v=nC5Lo_rANus)


## ⚙️ Project Architecture

<p>
  This application is developed using a clean architecture approach with a focus on maintainability and testability.

How the architecture is structured:
- <strong>Pages</strong>: UI components and screens
- <strong>Components</strong>: Reusable widget examples
- <strong>Services</strong>: Business logic and backend interactions
- <strong>Models</strong>: Data structures and entities
- <strong>Utils</strong>: Helper functions and utilities

Benefits:
- <strong>Separation of Concerns</strong>: Each layer has a clear role, making the app easy to maintain.
- <strong>Testability</strong>: Modular components are simple to test individually.
- <strong>Scalability</strong>: Supports adding new features without disrupting existing functionality.
</p>

## 🚀 Features

<h2>Key Features of Flutter Guidance</h2>
<ul>
  <li>📚 <strong>Comprehensive Widget Catalog</strong>: Explore a vast collection of Flutter widgets with practical examples.</li>
  <li>💡 <strong>Daily Flutter Tips</strong>: Get daily insights and best practices for Flutter development.</li>
  <li>🔍 <strong>Search & Filter</strong>: Quickly find the widgets and concepts you need.</li>
  <li>💾 <strong>Favorites System</strong>: Save your most used or interesting widgets for quick access.</li>
  <li>🕒 <strong>Recently Viewed</strong>: Easily return to widgets you've recently explored.</li>
  <li>📝 <strong>Copy-Ready Code Examples</strong>: Get implementation code that you can directly use in your projects.</li>
  <li>🌙 <strong>Dark Mode Support</strong>: Comfortable viewing experience in any lighting condition.</li>
  <li>📱 <strong>Responsive Design</strong>: Optimized for both phone and tablet experiences.</li>
</ul>

## 🛠️ Widget Categories

Flutter Guidance organizes widgets into intuitive categories to help you find what you need:

<details>
  <summary><strong>Layout Widgets</strong></summary>
  
  - **Containers & Boxes**
    - Container
    - SizedBox
    - ConstrainedBox
    
  - **Row & Column**
    - Row
    - Column
    - Flex
    - Expanded
    - Flexible
    
  - **Stack & Positioning**
    - Stack
    - Positioned
    - Align
</details>

<details>
  <summary><strong>Basic UI Components</strong></summary>
  
  - **Text Elements**
    - Text
    - RichText
    - SelectableText
  
  - **Input Elements**
    - TextField
    - Form
    - TextFormField
  
  - **Buttons**
    - ElevatedButton
    - TextButton
    - OutlinedButton
    - IconButton
</details>

<details>
  <summary><strong>Navigation & Routing</strong></summary>
  
  - **Navigation Elements**
    - Navigator
    - Routes
    - TabBar
    - BottomNavigationBar
    
  - **Drawers**
    - Drawer
    - EndDrawer
</details>

<details>
  <summary><strong>Animation & Effects</strong></summary>
  
  - **Basic Animations**
    - AnimatedContainer
    - AnimatedOpacity
    - Hero
    
  - **Advanced Animations**
    - AnimationController
    - Tween
    - CustomPainter
</details>

<details>
  <summary><strong>Dialog & Feedback</strong></summary>
  
  - **Alert Elements**
    - AlertDialog
    - SimpleDialog
    - SnackBar
    
  - **Bottom Sheets**
    - BottomSheet
    - ModalBottomSheet
</details>

<details>
  <summary><strong>Data & Backend</strong></summary>
  
  - **Network**
    - HTTP
    - Dio
    - WebSocket
    
  - **Storage**
    - SharedPreferences
    - Hive
    - SQLite
</details>

## 📦 Package Dependencies

| **Package**                   | **Version** |
|-------------------------------|-------------|
| flutter                       | sdk         |
| cupertino_icons               | ^1.0.8      |
| url_launcher                  | ^6.1.14     |
| firebase_core                 | ^3.12.1     |
| firebase_auth                 | ^5.5.1      |
| google_sign_in                | ^6.3.0      |
| fluttertoast                  | ^8.2.2      |
| dio                           | ^5.4.0      |
| web_socket_channel            | ^2.4.0      |
| shared_preferences            | ^2.2.2      |
| hive                          | ^2.2.3      |
| hive_flutter                  | ^1.1.0      |
| video_player                  | ^2.8.2      |
| flutter_launcher_icons        | ^0.14.3     |
| firebase_messaging            | ^15.2.4     |
| flutter_local_notifications   | ^16.2.0     |



## 🪽 Project Lead

<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%">
        <a href="https://github.com/melihalkbk">
          <img src="https://avatars.githubusercontent.com/u/102410189?v=4" width="100px;" alt="Melih Alakabak"/>
          <br /><sub><b>Melih Alakabak</b></sub>
        </a>
      </td>
    </tr>
  </tbody>
</table>

## 📱 Getting Started

### Prerequisites
- Flutter SDK (latest stable version recommended)
- Dart SDK
- Android Studio, VS Code, or another IDE with Flutter support
- iOS simulator or Android emulator (or physical device)

Tabii! İşte kurulum adımının devamı için önerilen markdown formatı:

```markdown
### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/melihalkbk/flutter_guidance.git
   ```

2. Navigate to the project directory:
   ```sh
   cd flutter_guidance
   ```

3. Get the dependencies:
   ```sh
   flutter pub get
   ```

4. Run the app:
   ```sh
   flutter run
   ```

Elbette! İşte düzenlenmiş ve daha okunabilir hale getirilmiş **Contributing** bölümü:

```markdown
### 🤝 Contributing

Contributions are welcome! If you'd like to contribute to **Flutter Guidance**, please follow these steps:

1. **Fork** the repository.

2. **Create a feature branch**:
   ```sh
   git checkout -b feature/amazing-feature
   ```

3. **Commit your changes**:
   ```sh
   git commit -m "Add some amazing feature"
   ```

4. **Push to the branch**:
   ```sh
   git push origin feature/amazing-feature
   ```

5. **Open a Pull Request** and briefly describe your changes.

### 📝 License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for full details.



