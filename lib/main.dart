import 'package:flutter/material.dart';
import './entrance_page.dart' as entrance_page;
import './sign_up_page.dart' as sign_up_page;
import './dart_lab_page.dart' as dart_lab_page;
import './aroma_dot_net_home_page.dart' as aroma_dot_net_home_page;
import './factory_page.dart' as factory_page;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        // 初期画面の class を指定。
        // The named parameter 'title' is required, but there's no corresponding argument. っていう lint error? が出る。
        // title 無しだと。この title が何かわからん。
        '/': (context) => const MyHomePage(title: 'FlutterLab.HomePage !'),
        // DartLabPage ページの class を指定。
        '/dart-lab-page': (context) => const dart_lab_page.DartLabPage(),
        '/entrance-page': (context) => const entrance_page.EntrancePage(),
        '/sign-up-page': (context) => const sign_up_page.SignUpPage(),
        '/aroma-dot-net-home-page': (context) => const aroma_dot_net_home_page.AromaDotNetHomePage(),
        '/factory-page': (context) => const factory_page.FactoryPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // NOTE: どこに ElevatedButton を配置すればいいのかわからなかったので、 qiita を読んで
            //       Row, Column, Center, Container を知って、この位置を見出したぜ。
            ElevatedButton(
              // Prefer const with constant constructors. っていう lint error? が出る。 const 無しのとき。
              child: const Text('DartLabPage へ進む。'),
              onPressed: () {
                // ignore: avoid_print
                print('"DartLabPage へ進む" が押された。');
                // route を使わない場合、こんなの↓になる。
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const DartLabPage()))
                Navigator.pushNamed(context, '/dart-lab-page');
              },
            ),
            ElevatedButton(
              // Prefer const with constant constructors. っていう lint error? が出る。 const 無しのとき。
              child: const Text('EntrancePage へ。'),
              onPressed: () {
                Navigator.pushNamed(context, '/entrance-page');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
