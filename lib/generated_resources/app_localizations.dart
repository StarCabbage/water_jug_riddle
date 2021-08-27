import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  static List<Locale> supportedLocales = [];
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, dynamic> _localizedStrings = {};

  Future<bool> load() async {
    String prefix = kIsWeb ? '' : 'assets/';
    String jsonString =
        await rootBundle.loadString('${prefix}languages/$locale.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap;

    return true;
  }

  String translate(String key, [List args = const []]) {
    if (key.contains('.')) {
      Map<String, dynamic> _localizedMap = _localizedStrings;
      List keyPoints = key.split('.');
      for (int i = 0, length = keyPoints.length - 1; i < length; i++) {
        _localizedMap = _localizedMap[keyPoints[i]];
      }
      return _smartReplacer(_localizedMap[keyPoints.last].toString(), args);
    }
    return _smartReplacer(_localizedStrings[key].toString(), args);
  }

  String t(String key, [List args = const []]) {
    return translate(key, args);
  }
}

String t(BuildContext context, String key, [List args = const []]) {
  return AppLocalizations.of(context).t(key, args);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLocales.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

String _smartReplacer(String string, List data) {
  if (data.length > 0) {
    List dataTime = List.from(data);
    dataTime.removeAt(0);
    return _smartReplacer(
        string.replaceFirst("{}", data.first.toString()), dataTime);
  } else
    return string;
}
