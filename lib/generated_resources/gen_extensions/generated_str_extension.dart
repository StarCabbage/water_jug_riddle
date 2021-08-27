/*Внимание! В данном файле нельзя производить изменения вручную. Т.к. генератор просто удалит их.
              Используйте плагин flutter_serve для внесения изменений: flutter pub run flutter_serve*/
import 'package:flutter/material.dart';
import '_generated_str_extension.dart';
import '../app_localizations.dart';

extension Languages on String {
  ///Translation function
  l(BuildContext context, [List args = const []]) {
    try {
      return AppLocalizations.of(context).t(this, args);
    } catch (e) {
      return this;
    }
  }

  call(BuildContext context, [List args = const []]) => l(context, args);
}

// ignore: non_constant_identifier_names
final _Strings strings = _Strings();

class _Strings {
  Global get global => Global();
  Pages get pages => Pages();
}
