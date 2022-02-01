import 'package:all/screens/mainpage.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram-demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.blueGrey
        )
      ),
      home: const Mainpage(),
    );
  }
}