# demo_real_estate_project

# Android running commands for running and building the app

# SimpsonsViewer Commands

flutter run --flavor simpsons -t lib/main_simpsons.dart
flutter run --release --flavor simpsons -t lib/main_simpsons.dart
flutter build appbundle -t lib/main_simpsons.dart --release --flavor simpsons
flutter build apk -t lib/main_simpsons.dart --release --flavor simpsons

# WireViewer Commands

flutter run --flavor wire -t lib/main_wire.dart
flutter run --release --flavor wire -t lib/main_wire.dart
flutter build appbundle -t lib/main_wire.dart --release --flavor wire
flutter build apk -t lib/main_wire.dart --release --flavor wire
