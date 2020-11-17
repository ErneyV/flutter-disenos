import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadroAnimado(),
      ),
    );
  }
}

class CuadroAnimado extends StatefulWidget {
  @override
  _CuadroAnimadoState createState() => _CuadroAnimadoState();
}

class _CuadroAnimadoState extends State<CuadroAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.25, curve: Curves.easeOut)));

    opacidadOut = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0.75, 1)));

    moverDerecha = Tween(begin: 0.1, end: 200.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    agrandar = Tween(begin: 0.1, end: 2.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    super.initState();

    animationController.addListener(() {
      //print('Sataus: + ${animationController.status}');

      if (animationController.status == AnimationStatus.completed) {
        animationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //play/ Reproducir
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0.0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: Opacity(
                  opacity: opacidadOut.value,
                  child: childRectangulo,
                ),
              ),
            ),
          ),
        );
      },
    );
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
