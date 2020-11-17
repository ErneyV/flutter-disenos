import 'package:disenos/src/theme/theme_changed.dart';
import 'package:disenos/src/widgets/slideShow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(child: MiSlideShow()),
        Expanded(child: MiSlideShow()),
      ],
    ));
  }
}

class MiSlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final acentColor = appTheme.curreuntTheme.accentColor;
    return SlideShow(
      bulletPrimario: 20.0,
      bulletSecundario: 12.0,
      colorPrimario: (appTheme.darkTheme) ? acentColor : Colors.red,
      puntosArriba: false,
      // colorPrimario: Colors.red,
      // colorSecundario: Colors.blue,
      slides: [
        SvgPicture.asset('assets/svgs/slide6.svg'),
        SvgPicture.asset('assets/svgs/slide7.svg'),
        SvgPicture.asset('assets/svgs/slide8.svg'),
        SvgPicture.asset('assets/svgs/slide9.svg'),
        SvgPicture.asset('assets/svgs/slide10.svg'),
      ],
    );
  }
}
