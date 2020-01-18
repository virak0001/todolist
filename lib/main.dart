import 'package:flutter/material.dart';

import 'modalDialog.dart';

void main() => runApp(Home());
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ModalDialog(),
    );
  }
}