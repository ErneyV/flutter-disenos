import 'package:flutter/material.dart';

import 'package:disenos/src/routers/routes.dart';
import 'package:disenos/src/theme/theme_changed.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).curreuntTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dieseño de flutter'),
        backgroundColor: appTheme.accentColor,
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).curreuntTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[index].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => pageRoutes[index].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final acentColor = appTheme.curreuntTheme.accentColor;
    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: acentColor,
                  child: Text(
                    'HH',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              Expanded(child: _ListaOpciones()),
              ListTile(
                leading: Icon(Icons.lightbulb_outline, color: acentColor),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  onChanged: (value) => appTheme.darkTheme = value,
                ),
              ),
              SafeArea(
                bottom: true,
                left: false,
                right: false,
                top: false,
                child: ListTile(
                  leading: Icon(Icons.lightbulb_outline, color: acentColor),
                  title: Text('Custom Them'),
                  trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    onChanged: (value) => appTheme.customTheme = value,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
