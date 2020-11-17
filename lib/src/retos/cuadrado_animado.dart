import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatefulWidget {
  const CuadradoAnimadoPage({Key key}) : super(key: key);

  @override
  _CuadradoAnimadoPageState createState() => _CuadradoAnimadoPageState();
}

class _CuadradoAnimadoPageState extends State<CuadradoAnimadoPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  // animaciones

  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquerda;
  Animation<double> moverAbajo;

  @override
  void initState() {
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 4));

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      curve: Interval(0.0, 0.25, curve: Curves.bounceOut),
      parent: controller,
    ));
    moverArriba = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      curve: Interval(0.25, 0.5, curve: Curves.bounceOut),
      parent: controller,
    ));

    moverIzquerda = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      curve: Interval(0.5, 0.75, curve: Curves.bounceOut),
      parent: controller,
    ));

    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      curve: Interval(0.75, 1.0, curve: Curves.bounceOut),
      parent: controller,
    ));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
      body: Center(
          child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return Transform.translate(
                    offset: Offset(moverDerecha.value + moverIzquerda.value,
                        moverArriba.value + moverAbajo.value),
                    child: RectanguloWidget());
              })),
    );
  }
}

class RectanguloWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Rectangulo();
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
