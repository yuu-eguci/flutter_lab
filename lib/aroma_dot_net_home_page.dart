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
    );
  }
}
