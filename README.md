# sanjayck243-Circular-Economy-Marketplace
CEM - Circular Economy Marketplace: A cross-platform Flutter mobile app promoting sustainable consumption through buying, selling, renting, and donating pre-owned items. Built with Dart, Firebase backend, featuring real-time marketplace functionality and community-driven sustainability features. Reducing waste, one transaction at a time.

# 🌍 CEM - Circular Economy Marketplace

A Flutter mobile application that promotes sustainable consumption through buying, selling, renting, and donating pre-owned items.

## 🚀 Getting Started

Follow these steps to set up and run the CEM project on your local machine.

### Prerequisites

Make sure you have the following installed:

- **Flutter SDK** (latest stable version)
- **Dart SDK** (comes with Flutter)
- **Android Studio** (for Android development)
- **Xcode** (for iOS development - Mac only)
- **Git**
- **Firebase account**

### Step 1: Verify Flutter Installation

```bash
flutter doctor
```
Resolve any issues shown by the doctor command.

### Step 2: Clone the Repository

```bash
git clone https://github.com/yourusername/cem-circular-economy-marketplace.git
cd cem-circular-economy-marketplace
```

### Step 3: Install Dependencies

```bash
flutter pub get
```

### Step 4: Firebase Setup

1. **Create Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Click "Create a project"
   - Enter project name: "CEM-App"
   - Follow the setup wizard

2. **Add Android App**
   - Click "Add app" → Android
   - Package name: `com.example.cem` (or your preferred package name)
   - Download `google-services.json`
   - Place it in `android/app/` directory

3. **Add iOS App (if developing for iOS)**
   - Click "Add app" → iOS
   - Bundle ID: `com.example.cem` (or your preferred bundle ID)
   - Download `GoogleService-Info.plist`
   - Place it in `ios/Runner/` directory

4. **Enable Firebase Services**
   - Go to Authentication → Sign-in method
   - Enable "Email/Password"
   - Go to Firestore Database → Create database
   - Start in test mode
   - Go to Storage → Get started
   - Start in test mode

### Step 5: Configure Firebase in Flutter

Add Firebase dependencies to `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.24.2
  firebase_auth: ^4.15.3
  cloud_firestore: ^4.13.6
  firebase_storage: ^11.5.6
  google_fonts: ^6.1.0
```

Run:
```bash
flutter pub get
```

### Step 6: Update Main Application Code

Replace the content of `lib/main.dart` with the CEM application code provided.

### Step 7: Create Assets Directory

Create the following folder structure:
```
assets/
├── images/
│   ├── banner1.jpg
│   ├── banner2.jpg
│   ├── banner3.jpg
│   ├── product1.jpg
│   ├── product2.jpg
│   ├── product3.jpg
│   └── product4.jpg
```

Add to `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
```

### Step 8: Run the Application

1. **Start an emulator** (Android Studio) or **connect a physical device**

2. **Check connected devices:**
   ```bash
   flutter devices
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

### Step 9: Testing Different Platforms

**For Android:**
```bash
flutter run -d android
```

**For iOS (Mac only):**
```bash
flutter run -d ios
```

**For web:**
```bash
flutter run -d chrome
```

### Step 10: Building for Production

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle:**
```bash
flutter build appbundle --release
```

**iOS (Mac only):**
```bash
flutter build ios --release
```

## 📁 Project Structure

```
lib/
└── main.dart          # Main application file with all UI components

assets/
└── images/            # Image assets for banners and products

android/
├── app/
│   └── google-services.json    # Firebase config for Android

ios/
└── Runner/
    └── GoogleService-Info.plist # Firebase config for iOS
```

## 🔧 Configuration

### Firestore Database Rules

Go to Firebase Console → Firestore Database → Rules and update:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

### Firebase Storage Rules

Go to Firebase Console → Storage → Rules and update:

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if true;
    }
  }
}
```

## 🐛 Troubleshooting

### Common Issues:

1. **Flutter doctor issues:**
   ```bash
   flutter doctor --android-licenses
   ```

2. **Gradle build failed:**
   - Update Android Gradle Plugin in `android/build.gradle`
   - Clean and rebuild: `flutter clean && flutter pub get`

3. **Firebase not working:**
   - Ensure `google-services.json` is in correct location
   - Check package name matches Firebase configuration
   - Run `flutter clean` and rebuild

4. **iOS build issues:**
   - Open `ios/Runner.xcworkspace` in Xcode
   - Update iOS deployment target to 11.0 or higher
   - Ensure development team is selected

### Debug Commands:

```bash
# Clean build files
flutter clean

# Get dependencies
flutter pub get

# Run with verbose output
flutter run -v

# Build and install debug APK
flutter install
```

## 📱 Features to Test

Once the app is running, test these features:

1. **App Launch** - Verify the app starts correctly
2. **Navigation** - Test bottom navigation and drawer
3. **Search Bar** - Check search functionality
4. **Banner Slider** - Verify image slider works
5. **Featured Products** - Test horizontal scrolling
6. **Service Cards** - Tap on Buy & Sell, Rent & Donate, etc.
7. **Login/Signup Buttons** - Test dialog popups

## 🔄 Making Changes

To modify the app:

1. **Edit `lib/main.dart`** for UI changes
2. **Update assets** in `assets/images/` folder
3. **Modify `pubspec.yaml`** for dependencies
4. **Hot reload** during development: Press `r` in terminal
5. **Hot restart** for major changes: Press `R` in terminal

## 📋 Next Steps

After successfully running the basic app:

1. **Add real images** to assets folder
2. **Implement Firebase authentication** logic
3. **Create data models** for products and users
4. **Add Firestore CRUD operations**
5. **Implement image upload** functionality
6. **Add navigation** between screens
7. **Implement search** and filtering
8. **Add user profiles** and settings

This README provides a complete step-by-step guide to get the CEM project running locally and ready for further development.
