import 'package:flutter/material.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar を指定しないことで、まっさらなページにしている。
      body: Container(
        // Background color というオプションは無い。
        decoration: BoxDecoration(
          color: Colors.blue[100]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Text(
              'Already a User',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            label: 'Sign in',
          ),
          // FIXME: 背景が赤くなっていない。 backgroundColor: Colors.red によってこの item の背景色を赤くしているつもりなのだがなっていない。
          BottomNavigationBarItem(
            icon: Text(
              'New User',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            label: 'Sign up',
            backgroundColor: Colors.red,
          ),
        ],
        onTap: (int index) {
          // ここには items の index 番号が入ってくる。
          if (index == 0) {
            // "Already a User" は今回何もしない。
          } else if (index == 1) {
            Navigator.pushNamed(context, '/sign-up-page');
          }
        },
      )
    );
  }
}
