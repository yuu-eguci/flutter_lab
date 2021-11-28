import 'package:flutter/material.dart';

class FactoryPage extends StatelessWidget {
  const FactoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 戻るボタンを排除するパラメータ。
        automaticallyImplyLeading: false,
        title: const Text('Your Factory'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            // FIXME: margin とかのとり方がわからんので、とりあえず均一に並べてある。
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('images/sample.png'),
              const Text(
                'あなただけの香りを\n製造しましょう',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              OutlinedButton.icon(
                icon: const Icon(
                  Icons.sports_bar_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'つくる',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.black,
                  minimumSize: const Size(200, 60),
                ),
                onPressed: () {
                },
              ),
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
        currentIndex: 1,
        onTap: (int index) {
          // ここには items の index 番号が入ってくる。
          if (index == 0) {
            Navigator.pushNamed(context, '/aroma-dot-net-home-page');
          } else if (index == 1) {
            // ここが "Factory" です。
          } else if (index == 2) {
            // "Purchase" は今回何もしない。
          } else if (index == 3) {
            // "お知らせ" は今回何もしない。
          } else if (index == 4) {
            // "Account" は今回何もしない。
          }
        },
      )
    );
  }
}
