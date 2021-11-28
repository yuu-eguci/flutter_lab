import 'package:flutter/material.dart';

class AromaDotNetHomePage extends StatelessWidget {
  const AromaDotNetHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('aroma.net'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            // FIXME: margin とかのとり方がわからんので、とりあえず均一に並べてある。
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
            ],
          ),

        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // items が4個以上のときは fixed が必要。
        // 無いとアイコンが白くなる。意味不明だが。
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_hdr),
            label: 'Factory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Purchase',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ring_volume),
            label: 'お知らせ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Account',
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
