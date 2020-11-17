import 'package:disenos/src/pages/emergency_pages.dart';
import 'package:disenos/src/pages/graficas_circulares_pages.dart';
import 'package:disenos/src/pages/headers_pages.dart';
import 'package:disenos/src/pages/pinterest_page.dart';
import 'package:disenos/src/pages/slideShow_page.dart';
import 'package:disenos/src/pages/slider_list_page.dart';
import 'package:disenos/src/retos/cuadrado_animado.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Routes>[
  _Routes(FontAwesomeIcons.slideshare, 'SliderShow', SlideshowPage()),
  _Routes(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Routes(FontAwesomeIcons.heading, 'Encabezado', HeadersPages()),
  _Routes(
      FontAwesomeIcons.peopleCarry, 'Cuadro Animado', CuadradoAnimadoPage()),
  _Routes(FontAwesomeIcons.circleNotch, 'Barra Progreso',
      GraficasCircularesPages()),
  _Routes(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Routes(FontAwesomeIcons.mobile, 'Pinterest', SliverListPage()),
];

class _Routes {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Routes(this.icon, this.titulo, this.page);
}
