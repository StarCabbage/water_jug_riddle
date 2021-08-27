import 'package:flutter/material.dart';
import 'package:water_jug_riddle/generated_resources/app_localizations.dart';

import 'root_widget.dart';

void main() {
  AppLocalizations.supportedLocales.add(const Locale('en', 'US'));
  runApp(const WaterJugRiddleApp());
}
