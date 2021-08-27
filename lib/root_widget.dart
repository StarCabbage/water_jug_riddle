import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:water_jug_riddle/constants/constants.dart';
import 'package:water_jug_riddle/generated_resources/app_localizations.dart';
import 'package:water_jug_riddle/navigation/navigator.dart';
import 'package:water_jug_riddle/stores/input_store/input_store.dart';
import 'package:water_jug_riddle/stores/welcome_store/welcome_store.dart';

class WaterJugRiddleApp extends StatelessWidget {
  const WaterJugRiddleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Welcome>(create: (_) => Welcome()),
        Provider<Input>(create: (_) => Input()..setupReactions()),
      ],
      child: MaterialApp(
        title: 'Water Jug Riddle. By YKapustin',
        theme: ConstantsTheme.primaryTheme,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: NavigatorManager.onGenerateRoute,
        initialRoute: NavigatorManager.homePage,
      ),
    );
  }
}
