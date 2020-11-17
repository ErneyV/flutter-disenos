// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData iconData;

  PinterestButton({
    @required this.iconData,
    @required this.onPressed,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgraundColor;
  final Color activeColor;
  final Color incativeColor;
  final List<PinterestButton> items;
  PinterestMenu(
      {this.mostrar = true,
      this.backgraundColor = Colors.white,
      this.activeColor = Colors.black,
      this.incativeColor = Colors.blueGrey,
      @required this.items});

  // final List<PinterestButton> items = [
  //   PinterestButton(
  //       iconData: Icons.pie_chart,
  //       onPressed: () {
  //         print('Icon Pie_chart');
  //       }),
  //   PinterestButton(
  //       iconData: Icons.search,
  //       onPressed: () {
  //         print('Icon Search');
  //       }),
  //   PinterestButton(
  //       iconData: Icons.notification_important,
  //       onPressed: () {
  //         print('Icon notification_important');
  //       }),
  //   PinterestButton(
  //       iconData: Icons.supervised_user_circle,
  //       onPressed: () {
  //         print('Icon Supervised_user_circle');
  //       })
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgraundColor = backgraundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).incativeColor = incativeColor;

            return _BuildMenuBackgraund(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _BuildMenuBackgraund extends StatelessWidget {
  final Widget child;
  const _BuildMenuBackgraund({@required this.child});

  @override
  Widget build(BuildContext context) {
    Color backGraundColor = Provider.of<_MenuModel>(context).backgraundColor;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backGraundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              spreadRadius: -5,
            ),
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);
  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.iconData,
          size: (itemSeleccionado == index) ? 35 : 27,
          color: (itemSeleccionado == index)
              ? menuModel.activeColor
              : menuModel.incativeColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  Color backgraundColor = Colors.white;
  Color activeColor = Colors.black;
  Color incativeColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}
