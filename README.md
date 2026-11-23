# Hash

Hash is a Flutter app starter with a branded splash screen and a feature-based
sign-in/sign-up experience.

## Project structure

- `lib/core/` contains shared navigation, theme, form controls, and validators.
- `lib/features/splash/` contains the splash experience.
- `lib/features/auth/` contains the sign-in and sign-up pages.

## Authentication

The authentication forms currently provide client-side validation only. Connect
the submit handlers to an authentication service before using them to create or
sign in to real accounts.

## Run and test

Run the app with `flutter run` and the test suite with `flutter test`.

## Required pull request checks

The GitHub Actions workflow reports a `Flutter checks` status on pushes and pull
requests. To block merging when it fails, make `Flutter checks` a required status
check in the repository's branch protection rule or ruleset.
