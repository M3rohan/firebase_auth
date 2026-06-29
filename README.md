# auth_firebase

A Flutter task manager app that uses Firebase Authentication and Cloud Firestore.

## Features

- Email/password sign up and login with Firebase Authentication
- Persistent task storage in Cloud Firestore
- Add tasks with title, description, due date, and custom color
- Task list filtered by the currently authenticated user
- Swipe to delete tasks from Firestore

## Project Overview

This app starts with Firebase initialization in `lib/main.dart` and displays either a sign-up screen or the home task list depending on the user authentication state.

The main screens are:

- `lib/src/signup_page.dart` — sign up new users
- `lib/src/login_page.dart` — sign in existing users
- `lib/src/home_page.dart` — view tasks for the signed-in user
- `lib/src/add_new_task.dart` — create and upload new tasks

## Setup

1. Install Flutter and ensure it is available on your PATH.
2. Open the project folder in your editor.
3. Run:

```bash
flutter pub get
```

4. Configure Firebase for your app:
   - Ensure `firebase_options.dart` exists in `lib/`
   - Android is already configured with `android/app/google-services.json`
   - If you need iOS support, add `GoogleService-Info.plist` to `ios/Runner`

5. Run the app:

```bash
flutter run
```

## Firebase Requirements

The app uses the following Firebase features:

- `firebase_auth` for email/password authentication
- `cloud_firestore` for storing tasks

Firestore collection structure:

- Collection: `tasks`
- Document fields:
  - `title` (String)
  - `description` (String)
  - `date` (Timestamp)
  - `creator` (String user UID)
  - `postedAt` (Timestamp)
  - `color` (String hex color)

## Dependencies

Key dependencies used by the app:

- `firebase_core`
- `firebase_auth`
- `cloud_firestore`
- `image_picker`
- `intl`
- `flex_color_picker`

## Notes

- The app currently uses email/password auth only.
- Task deletion is handled by swiping tasks in the home list.
- The task color is saved as a hex string and reconstructed in the UI.

## Useful Commands

```bash
flutter clean
flutter pub get
flutter run
```
