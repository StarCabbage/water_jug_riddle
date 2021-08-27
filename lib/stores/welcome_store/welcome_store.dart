import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:water_jug_riddle/navigation/navigator.dart';

part 'welcome_store.g.dart';

class Welcome = _Welcome with _$Welcome;

abstract class _Welcome with Store {
  @action
  Future<void> move2NextPage(BuildContext context) async {
    return Navigator.pushReplacementNamed(context, NavigatorManager.inputPage)
        .then((_) {});
  }
}
