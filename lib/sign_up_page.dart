import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        // これは影を消す設定。
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            // FIXME: margin とかのとり方がわからんので、とりあえず均一に並べてある。
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'Sign up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              const Text(
                'Registration is free.',
              ),
              OutlinedButton(
                child: const Text('Sign up with e-mail'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.black),
                ),
                onPressed: () {
                  // FIXME: 本当は "くるん" って遷移したいんだけどサンプルが見つからない
                  Navigator.pushNamed(context, '/aroma-dot-net-home-page');
                },
              ),
              OutlinedButton(
                child: const Text('Sign up with Facebook'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/aroma-dot-net-home-page');
                },
              ),
              OutlinedButton(
                child: const Text('Sign up with LINE'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/aroma-dot-net-home-page');
                },
              ),
              OutlinedButton(
                child: const Text('Sign up with Apple'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/aroma-dot-net-home-page');
                },
              ),
            ],
          ),

        ),
      ),
    );
  }
}
