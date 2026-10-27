import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_lab/main.dart';

// iPhone SE (第1世代) の画面サイズです。最小の想定サイズとして検証します。
const sizes = {'縦 320x568': Size(320, 568), '横 568x320': Size(568, 320)};

const routes = [
  '/',
  '/dart-lab-page',
  '/entrance-page',
  '/sign-up-page',
  '/aroma-dot-net-home-page',
  '/factory-page',
];

void main() {
  for (final MapEntry(key: name, value: size) in sizes.entries) {
    for (final route in routes) {
      testWidgets('$route は $name で overflow しない', (tester) async {
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.reset);
        tester.binding.platformDispatcher.defaultRouteNameTestValue = route;
        addTearDown(
          tester.binding.platformDispatcher.clearDefaultRouteNameTestValue,
        );

        await tester.pumpWidget(const MyApp());
        await tester.pumpAndSettle();

        // overflow すると "A RenderFlex overflowed by ..." が報告されます。
        expect(tester.takeException(), isNull);
      });
    }
  }
}
