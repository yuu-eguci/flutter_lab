import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_lab/aroma_dot_net_home_page.dart';
import 'package:flutter_lab/dart_lab_page.dart';
import 'package:flutter_lab/entrance_page.dart';
import 'package:flutter_lab/factory_page.dart';
import 'package:flutter_lab/main.dart';
import 'package:flutter_lab/sign_up_page.dart';

Future<void> tapAndSettle(WidgetTester tester, String text) async {
  await tester.tap(find.text(text));
  await tester.pumpAndSettle();
}

// Android の戻るボタンやブラウザの戻る操作と同じです。
Future<void> pressBack(WidgetTester tester) async {
  await tester.binding.handlePopRoute();
  await tester.pumpAndSettle();
}

Future<void> openSignUpPage(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tapAndSettle(tester, 'EntrancePage へ。');
  await tapAndSettle(tester, 'New User');
}

Future<void> openAromaDotNetHomePage(WidgetTester tester) async {
  await openSignUpPage(tester);
  await tapAndSettle(tester, 'Sign up with e-mail');
}

void main() {
  testWidgets('Home → DartLabPage → "前のとこへ戻る" で Home', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAndSettle(tester, 'DartLabPage へ進む。');
    expect(find.byType(DartLabPage), findsOneWidget);

    await tapAndSettle(tester, '前のとこへ戻る');
    expect(find.byType(MyHomePage), findsOneWidget);
  });

  testWidgets('Entrance の "Already a User" は何もしない、"New User" で SignUpPage', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tapAndSettle(tester, 'EntrancePage へ。');
    expect(find.byType(EntrancePage), findsOneWidget);

    await tapAndSettle(tester, 'Already a User');
    expect(find.byType(EntrancePage), findsOneWidget);

    await tapAndSettle(tester, 'New User');
    expect(find.byType(SignUpPage), findsOneWidget);
  });

  for (final button in [
    'Sign up with e-mail',
    'Sign up with Facebook',
    'Sign up with LINE',
    'Sign up with Apple',
  ]) {
    testWidgets('SignUpPage の "$button" で aroma.net (戻るボタン無し)', (tester) async {
      await openSignUpPage(tester);
      await tapAndSettle(tester, button);

      expect(find.byType(AromaDotNetHomePage), findsOneWidget);
      expect(find.byType(BackButton), findsNothing);
    });
  }

  testWidgets('aroma.net の何もしないボタンとタブでは動かない', (tester) async {
    await openAromaDotNetHomePage(tester);

    for (final text in ['Home', 'Purchase', 'お知らせ']) {
      await tapAndSettle(tester, text);
      expect(find.byType(AromaDotNetHomePage), findsOneWidget);
    }
    await tester.tap(find.text('Another content').first);
    await tester.pumpAndSettle();
    expect(find.byType(AromaDotNetHomePage), findsOneWidget);
  });

  testWidgets('aroma.net の "Your Factory" で FactoryPage、"Home" タブで戻る', (
    tester,
  ) async {
    await openAromaDotNetHomePage(tester);
    await tapAndSettle(tester, 'Your Factory');
    expect(find.byType(FactoryPage), findsOneWidget);

    await tapAndSettle(tester, 'Home');
    expect(find.byType(AromaDotNetHomePage), findsOneWidget);
  });

  testWidgets('aroma.net の "Factory" タブで FactoryPage、そこの何もしないタブでは動かない', (
    tester,
  ) async {
    await openAromaDotNetHomePage(tester);
    await tapAndSettle(tester, 'Factory');
    expect(find.byType(FactoryPage), findsOneWidget);

    for (final text in ['Factory', 'Purchase', 'お知らせ', 'つくる']) {
      await tapAndSettle(tester, text);
      expect(find.byType(FactoryPage), findsOneWidget);
    }
  });

  testWidgets('aroma.net で Account (ログアウト) → 戻ると Home で、aroma.net には戻れない', (
    tester,
  ) async {
    await openAromaDotNetHomePage(tester);
    await tapAndSettle(tester, 'Account');
    expect(find.byType(EntrancePage), findsOneWidget);

    await pressBack(tester);
    expect(find.byType(MyHomePage), findsOneWidget);
  });

  testWidgets('FactoryPage で Account (ログアウト) → 戻ると Home で、aroma.net には戻れない', (
    tester,
  ) async {
    await openAromaDotNetHomePage(tester);
    await tapAndSettle(tester, 'Your Factory');
    await tapAndSettle(tester, 'Account');
    expect(find.byType(EntrancePage), findsOneWidget);

    await pressBack(tester);
    expect(find.byType(MyHomePage), findsOneWidget);
  });

  testWidgets('Web で知らない URL (route) を開いたら Home になる', (tester) async {
    tester.binding.platformDispatcher.defaultRouteNameTestValue =
        '/no-such-page';
    addTearDown(
      tester.binding.platformDispatcher.clearDefaultRouteNameTestValue,
    );

    await tester.pumpWidget(const MyApp());

    // debug ビルドでは "Could not navigate to initial route." が報告されます。
    expect(
      tester.takeException(),
      contains('Could not navigate to initial route.'),
    );
    expect(find.byType(MyHomePage), findsOneWidget);
  });
}
