import 'package:avaliar/src/ui/mobile/pages/login/index.dart';
import 'package:flutter/material.dart';

class AppMobile extends StatelessWidget {
  const AppMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avaliar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
