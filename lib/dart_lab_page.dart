import 'package:flutter/material.dart';

class DartLabPage extends StatelessWidget {
  // Use key in widget constructors.dartuse_key_in_widget_constructors っていう lint error? が出る。
  // これ↓が無いと。
  const DartLabPage({Key? key}) : super(key: key);

  // DartLabPage では色んな処理をお試しするよ。これは各ボタンのデフォルト onPressed 関数。
  void _doNothing() {
    // ignore: avoid_print
    print('doNothing!');
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold は "足場"。
    return Scaffold(
      appBar: AppBar(
        title: const Text('DartLabPage'),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.yellow[100],
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('前のとこへ戻る'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: const Text('doNothing'),
                  onPressed: _doNothing,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('doNothing'),
                  onPressed: _doNothing,
                ),
                ElevatedButton(
                  child: const Text('doNothing'),
                  onPressed: _doNothing,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('doNothing'),
                  onPressed: _doNothing,
                ),
                ElevatedButton(
                  child: const Text('doNothing'),
                  onPressed: _doNothing,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('doNothing'),
                  onPressed: _doNothing,
                ),
                ElevatedButton(
                  child: const Text('doNothing'),
                  onPressed: _doNothing,
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
