import 'package:disenos/src/theme/theme_changed.dart';
import 'package:disenos/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final acentColor =
        Provider.of<ThemeChanger>(context).curreuntTheme.accentColor;
    return Scaffold(
      body: HeaderWeave(
        color: acentColor,
      ),
    );
  }
}
