import 'package:flutter/material.dart';
import 'package:flash_pro_fontend/first.dart';

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: First(),
    );
  }
}

void main() {
  runApp(const Main());

}
