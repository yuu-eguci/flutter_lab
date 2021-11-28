import 'package:flutter/material.dart';

class AromaDotNetHomePage extends StatelessWidget {
  const AromaDotNetHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 戻るボタンを排除するパラメータ。
        automaticallyImplyLeading: false,
        title: const Text('aroma.net'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            // FIXME: margin とかのとり方がわからんので、とりあえず均一に並べてある。
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.filter_hdr,
                  color: Colors.black,
                ),
                label: const Text(
                  'Your Factory',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 60),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/factory-page');
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.where_to_vote_rounded,
                  color: Colors.black45,
                ),
                label: const Text(
                  'Another content',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 60),
                  onPrimary: Colors.black45,
                ),
                onPressed: () {
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.where_to_vote_rounded,
                  color: Colors.black45,
                ),
                label: const Text(
                  'Another content',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 60),
                  onPrimary: Colors.black45,
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
        currentIndex: 0,
        onTap: (int index) {
          // ここには items の index 番号が入ってくる。
          if (index == 0) {
            // "Home" は今回何もしない。
          } else if (index == 1) {
            Navigator.pushNamed(context, '/factory-page');
          } else if (index == 2) {
            // "Purchase" は今回何もしない。
          } else if (index == 3) {
            // "お知らせ" は今回何もしない。
          } else if (index == 4) {
            Navigator.popAndPushNamed(context, '/entrance-page');
          }
        },
      )
    );
  }
}
