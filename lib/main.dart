import 'package:app_de_mensaje_joshue/config/theme/app_theme.dart';
import 'package:app_de_mensaje_joshue/presentation/providers/chat_provider.dart';
import 'package:app_de_mensaje_joshue/presentation/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// mat
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //Envolvimos en provider
      providers: [
        //Added _ bc we have the build context, since we do not care about it
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
          title: 'Yes No App',
          debugShowCheckedModeBanner: false, //takes off the debug sticker
          theme: AppTheme(selectedColor: 1)
              .theme(), //importamos de nuestro file app_theme
          home: const ChatScreen()),
    );
  }
}
