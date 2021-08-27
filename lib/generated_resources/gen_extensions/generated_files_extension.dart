import 'package:flutter/foundation.dart';

import '_generated_files_extension.dart';
/*Внимание! В данном файле нельзя производить изменения вручную. Т.к. генератор просто удалит их.
  Используйте плагин flutter_serve для внесения изменений: flutter pub run flutter_serve*/

extension Files on String {
  f(context, [List args = const []]) {
    if (!kIsWeb) {
      return 'assets/' + this;
    } else {
      return this;
    }
  }
}

_Files files = _Files();

class _Files {
  Languages get languages => Languages();
}
