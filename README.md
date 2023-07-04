# riverpod_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Freezedの使い方

前提: 必要なパッケージはインストール済み

ビルドを実行する場合は以下のコマンドを実行する。

```bash
dart run build_runner build
```

ファイルを編集しながら、自動でビルドを実行する場合は以下のコマンドを実行する。

```bash
dart run build_runner watch
```

## Golden Test

初回のテスト実施時に、参照する画像を作成する必要がある。
以下のようなコマンドを実行することで、画像を作成することができる。

```bash
flutter test --update-goldens test/golden_test.dart
```
