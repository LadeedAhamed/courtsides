import 'package:courtsides/utils/theme/theme.dart';
import 'package:flutter/material.dart';

/// --------- USE THIS CLASS TO SETUP THEMES, INITIAL BINDINGS, ANY ANIMATIONS AND MUCH MORE... ------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courtsides',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
    );
  }
}
