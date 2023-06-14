import 'package:app_de_mensaje_joshue/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

// mat
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false, //takes off the debug sticker
      theme: AppTheme(selectedColor: 5)
          .theme(), //importamos de nuestro file app_theme
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: FilledButton.tonal(
              onPressed: () {}, child: const Text('Click me')),
        ),
      ),
    );
  }
}
