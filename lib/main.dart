import 'package:disenos/src/pages/launcher_page.dart';
import 'package:disenos/src/theme/theme_changed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => new ThemeChanger(2),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).curreuntTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseño app',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(child: LauncherPage());
        },
      ),
    );
  }
}
