# flutter_lab

Flutter と Dart の学習用 Repository だよ。

- `MyHomePage`: Flutter テンプレートのカウンター。ここから各ページへ進む。
- `DartLabPage`: Dart のサンプルとかを書きなぐるページ。
- `EntrancePage` → `SignUpPage` → `AromaDotNetHomePage` → `FactoryPage`: "aroma.net" っぽいアプリの画面遷移のお試し。ログインとかの中身は無い。

- Flutter: 3.47.8 / Dart: 3.13.7
- Linter: flutter_lints 6 (`flutter analyze`)
- Test: `flutter test` (29件)
- Docker: 対応! (analyze・test・Web ビルドと配信)

## 対応プラットフォーム

| プラットフォーム | 状態 |
| --- | --- |
| Web | 対応 (`flutter build web` とブラウザでの表示を確認) |
| Docker | 対応 (`docker build` の中で analyze / test / web build して、nginx で配信) |
| Android | 対応 (`flutter build apk --debug` で debug APK ができるのを確認、CI でも毎回ビルドする。エミュレーターや実機で動かすのは未検証。リリースは当時のまま debug 鍵で署名する設定で、ストアには出していない) |
| iOS | 対応 (`flutter build ios --no-codesign` で署名なしの `Runner.app` ができるのを確認、CI でも毎回ビルドする。署名・実機・シミュレーター・ストアは未検証。署名の設定 (Team、bundle identifier) は当時のまま) |
| macOS / Windows / Linux | 非対応 (プロジェクトが無い) |

## パッと実行してみたい

Flutter 3.47.8 (stable, Dart 3.13.7) を使う。Docker と CI は `tool/install_flutter.sh` で公式リポジトリのタグ 3.47.8 を入れて、commit も確かめている。
上げるときは `tool/install_flutter.sh` の `FLUTTER_VERSION` と `FLUTTER_COMMIT`、この README を変える。

```bash
flutter --version  # Flutter 3.47.8
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

### Android / iOS

- Android: JDK 17 と Android SDK (compileSdk 36、NDK 28.2.13676358) が要る。Gradle 9.3.1 / Android Gradle Plugin 9.1.0 / Kotlin 2.4.0、minSdk 24 (Flutter 3.47.8 のテンプレートに合わせている)。
- iOS: Xcode が要る。deployment target は 15.0 (Flutter 3.47.8 のテンプレートと同じ)。
- 確かめたのは macOS 26.6、JDK 17 (Temurin 17.0.21)、Xcode 26.6 (iOS 26.5 SDK)。

```bash
flutter build apk --debug
flutter build ios --no-codesign
```

### Docker

Flutter を入れなくても、Docker だけで analyze / test / web build して、ブラウザで見られる。

```bash
docker build -t flutter-lab .
docker run --rm -p 8080:80 flutter-lab
# http://localhost:8080 を開く
```

### CI

GitHub Actions (`.github/workflows/ci.yml`) で、main への push と PR のたびに次をやる。

- 上の `docker build` (analyze / test / web build) と、`docker run` で web が配信されるか
- `flutter build apk --debug` (Ubuntu)
- `flutter build ios --no-codesign` (macOS)
- ビルドのあとに git の差分が無いか (Flutter がネイティブのファイルを書き換えたら落とす)

## 画面遷移

| route | ページ | 行き方 |
| --- | --- | --- |
| `/` | `MyHomePage` | 最初の画面 |
| `/dart-lab-page` | `DartLabPage` | Home の "DartLabPage へ進む。" |
| `/entrance-page` | `EntrancePage` | Home の "EntrancePage へ。" |
| `/sign-up-page` | `SignUpPage` | Entrance の "New User" |
| `/aroma-dot-net-home-page` | `AromaDotNetHomePage` | Sign up の 4 つのボタンどれでも |
| `/factory-page` | `FactoryPage` | aroma.net の "Your Factory" か "Factory" タブ |

- "Account" タブはログアウト扱い。Home (`/`) の上に `EntrancePage` だけが残るようにして、戻るで aroma.net に戻れないようにしている。
- 見た目は当時の Material 2 の黄色テーマのまま (`useMaterial3: false`)。

## テスト

`flutter test` で動く。

- `test/widget_test.dart`: カウンター。
- `test/navigation_test.dart`: 全ページの遷移、Sign up の 4 ボタン、ログアウト後の戻る、知らない route。
- `test/theme_test.dart`: 黄色テーマが保たれているか。
- `test/small_screen_test.dart`: 小さい画面 (320x568 とその横向き) で overflow しないか。

## メモ

- iPhone 実機ビルド (2021 年当時のメモ。署名が要るので、今の Flutter では未検証)
    - `open ios/Runner.xcworkspace`
    - Runner project > Signing & Capabilities > Team で Development Team を選ぶ
    - bundle identifier を自分のものに変える
- `.vscode/launch.json` の "flutter_lab (profile mode)" は profile ビルド。ケーブルを外しても iPhone で動く。

## 参考リンク

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter documentation](https://docs.flutter.dev/)
