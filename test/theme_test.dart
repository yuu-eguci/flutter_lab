import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_lab/main.dart';

// 実際に描画される Material (背景色と文字色) を取得します。
Material materialOf(WidgetTester tester, Finder finder) {
  return tester.widget<Material>(
    find.descendant(of: finder, matching: find.byType(Material)).first,
  );
}

Future<void> openRoute(WidgetTester tester, String route) async {
  tester.binding.platformDispatcher.defaultRouteNameTestValue = route;
  addTearDown(tester.binding.platformDispatcher.clearDefaultRouteNameTestValue);
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Home は当時 (Material 2) の黄色テーマのまま', (tester) async {
    await tester.pumpWidget(const MyApp());

    final appBar = materialOf(tester, find.byType(AppBar));
    expect(appBar.color, isSameColorAs(Colors.yellow.shade500));
    final title = tester.element(find.text('FlutterLab.HomePage !'));
    expect(DefaultTextStyle.of(title).style.color, isSameColorAs(Colors.black));

    final button = materialOf(
      tester,
      find.widgetWithText(ElevatedButton, 'EntrancePage へ。'),
    );
    expect(button.color, isSameColorAs(Colors.yellow.shade500));
    expect(button.textStyle?.color, isSameColorAs(Colors.black));

    final fab = materialOf(tester, find.byType(FloatingActionButton));
    expect(fab.color, isSameColorAs(Colors.yellow.shade500));

    // 当時の headline4 (Material 2 では 34)。
    expect(tester.widget<Text>(find.text('0')).style?.fontSize, 34);
  });

  testWidgets('SignUpPage のボタンの色は当時のまま', (tester) async {
    await openRoute(tester, '/sign-up-page');

    final expected = {
      'Sign up with e-mail': (Colors.transparent, Colors.black),
      'Sign up with Facebook': (Colors.blue, Colors.white),
      'Sign up with LINE': (Colors.green, Colors.white),
      'Sign up with Apple': (Colors.black, Colors.white),
    };
    for (final MapEntry(key: text, value: (background, foreground))
        in expected.entries) {
      final button = materialOf(
        tester,
        find.widgetWithText(OutlinedButton, text),
      );
      expect(button.color, isSameColorAs(background), reason: text);
      expect(button.textStyle?.color, isSameColorAs(foreground), reason: text);
    }
  });

  testWidgets('aroma.net の "Another content" は灰色の文字', (tester) async {
    await openRoute(tester, '/aroma-dot-net-home-page');

    final button = materialOf(
      tester,
      find.widgetWithText(ElevatedButton, 'Another content').first,
    );
    expect(button.color, isSameColorAs(Colors.yellow.shade500));
    expect(button.textStyle?.color, isSameColorAs(Colors.black45));
  });

  testWidgets('FactoryPage の "つくる" は黒地に白', (tester) async {
    await openRoute(tester, '/factory-page');

    final button = materialOf(
      tester,
      find.widgetWithText(OutlinedButton, 'つくる'),
    );
    expect(button.color, isSameColorAs(Colors.black));
    expect(button.textStyle?.color, isSameColorAs(Colors.white));
  });
}
