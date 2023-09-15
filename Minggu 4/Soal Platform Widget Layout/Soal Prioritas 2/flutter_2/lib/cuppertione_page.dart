import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home Page'),
      ),

      child: Center(
        child: Text('Ini Adalah Home Page'),
      ),
    );
  }
}