import 'package:disenos/src/theme/theme_changed.dart';
import 'package:disenos/src/widgets/radial_pogress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPages extends StatefulWidget {
  @override
  _GraficasCircularesPagesState createState() =>
      _GraficasCircularesPagesState();
}

class _GraficasCircularesPagesState extends State<GraficasCircularesPages> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
            setState(() {});
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    porcentaje: porcentaje, color: Colors.yellow),
                CustomRadialProgress(
                    porcentaje: porcentaje * 0.5, color: Colors.red),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    porcentaje: porcentaje * 1.5, color: Colors.green),
                CustomRadialProgress(
                    porcentaje: porcentaje * 2, color: Colors.blueAccent),
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color,
  });

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).curreuntTheme;
    return Container(
      width: 150,
      height: 150,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: appTheme.textTheme.bodyText1.color,
        grosorSecundario: 4,
        grosrPrimario: 10,
        mostarPorcentaje: true,
      ),
    );
  }
}
