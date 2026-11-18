# AI-Lingo (Flutter app)

Contextual English learning through AI-generated conversations.

## Project structure

Each feature keeps its own files together, so you can find everything about
"auth" or "onboarding" in one folder.

```
lib/
├── main.dart                  start-up (Firebase, runApp)
├── app.dart                   MaterialApp + AuthCubit + router
├── core/                      shared by all features
│   ├── constants/             asset paths
│   ├── theme/                 colors, fonts, text styles, ThemeData
│   ├── routing/               all routes in one place
│   ├── utils/                 form validators
│   └── widgets/               shared widgets (button, text field...)
└── features/
    ├── onboarding/            screens/ · widgets/
    ├── auth/
    │   ├── screens/           login, sign up, forgot password, check email
    │   ├── cubit/             AuthCubit + AuthState (screen logic)
    │   ├── data/              AuthRepository (Firebase) + AuthFailure
    │   └── models/            AuthUser
    ├── setup/                 (placeholder) level, interests, goals
    └── home/                  (placeholder)
```

How the pieces talk (one direction only):

```
Screen  →  Cubit  →  Repository  →  Firebase / Hive / AI
```

- A **screen** only draws widgets and calls the Cubit.
- A **Cubit** holds the state (loading, error, signed in) and calls the repository.
- A **repository** is the only code that talks to Firebase (later: Hive, the AI service).

New feature? Copy the same folders: `screens/`, `cubit/`, `data/`, `models/` (only the ones you need).

## Firebase

1. Create the project and enable Email/Password in the Firebase console.
2. Run `flutterfire configure` inside `ai_lingo` (Android package: `com.ailingo.app`).
3. Run the app.
