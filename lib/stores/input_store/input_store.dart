import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:water_jug_riddle/constants/input_constants.dart';
import 'package:water_jug_riddle/generated_resources/gen_extensions/generated_str_extension.dart';
import 'package:water_jug_riddle/uitls/jug_solver/jug_lib.dart';

part 'input_store.g.dart';

class Input = _Input with _$Input;

abstract class _Input with Store, _InputHelper {
  @observable
  int _jugX = ConstantsInput.defaultJugValue;

  @observable
  int _jugY = ConstantsInput.defaultJugValue;

  @observable
  int _jugZ = ConstantsInput.defaultJugValue;

  @observable
  bool isSolutionComputed = false;

  @observable
  bool solutionExist = false;

  @observable
  int numberOfSteps = 0;

  Solution? solution;

  ReactionDisposer? _dispose;

  void setupReactions() {
    _dispose = autorun((_) {
      if (_jugValuesReady2BeUsed()) {
        var solution = RiddleSolver.solve(_jugX, _jugY, _jugZ);
        isSolutionComputed = true;
        if (solution is Solution) {
          solutionExist = true;
          numberOfSteps = solution.actions.length;
          this.solution = solution;
        }
      }
    }, delay: 0);
  }

  void _resetSolutions() {
    isSolutionComputed = false;
    solutionExist = false;
    numberOfSteps = 0;
  }

  /// Jug validation

  FormFieldValidator<String> validateJug(BuildContext context) {
    String? _validateJug(String? jugValue) {
      if (jugValue == null || jugValue.isEmpty) {
      } else {
        var jugParsedValue =
            int.tryParse(jugValue) ?? double.tryParse(jugValue);

        if (jugParsedValue! > ConstantsInput.maxGallonsForJug) {
          return strings.pages.inputPage.errorAlerts.jugMaxAlert.l(context);
        }
        if (jugParsedValue <= 0) {
          return strings.pages.inputPage.errorAlerts.jugMinAlert.l(context);
        }
      }
    }

    return _validateJug;
  }

  bool _jugValuesReady2BeUsed() {
    return _jugX > 0 && _jugY > 0 && _jugZ > 0;
  }

  ///Jug values setters & getters

  void setJugX(String jugX) {
    _jugX = _setJugValue(jugX);
  }

  void setJugY(String jugY) {
    _jugY = _setJugValue(jugY);
  }

  void setJugZ(String jugZ) {
    _jugZ = _setJugValue(jugZ);
  }

  @computed
  int? get jugX => _getJugValue(_jugX);

  @computed
  int? get jugY => _getJugValue(_jugY);

  @computed
  int? get jugZ => _getJugValue(_jugZ);

  int _setJugValue(String jugValue) {
    ///activated on any changes
    _resetSolutions();
    var parsedValue = int.tryParse(jugValue);
    if (parsedValue != null && parsedValue >= 0) return parsedValue;
    return ConstantsInput.defaultJugValue;
  }

  int? _getJugValue(int jugValue) {
    if (jugValue == ConstantsInput.defaultJugValue) return null;
    return jugValue;
  }
}

mixin _InputHelper {
  String convert2HumanReadable(ActionJugStatePair pair, BuildContext context) {
    String _string = '';
    switch (pair.jugAction) {
      case JugAction.fill:
        var whichJugWasFilled = '';
        pair.jugState.x;
        if (pair.jugState.x != 0) {
          whichJugWasFilled = 'x';
        }
        if (pair.jugState.y != 0) {
          whichJugWasFilled = 'y';
        }
        _string = strings.pages.inputPage.alerts.explanation
            .fillBucket(context, [whichJugWasFilled]);
        break;
      case JugAction.empty:
        var whichJugWasFilled = '';
        pair.jugState.x;
        if (pair.jugState.x == 0) {
          whichJugWasFilled = 'x';
        }
        if (pair.jugState.y == 0) {
          whichJugWasFilled = 'y';
        }
        _string = strings.pages.inputPage.alerts.explanation
            .dumpBucket(context, [whichJugWasFilled]);
        break;
      case JugAction.transfer:
        var whichJugWasFilled = [];
        pair.jugState.x;
        if (pair.jugState.x < pair.jugState.y) {
          whichJugWasFilled = ['x', 'y'];
        } else {
          whichJugWasFilled = ['y', 'x'];
        }

        _string = strings.pages.inputPage.alerts.explanation
            .transferBucket(context, whichJugWasFilled);
        break;
      case JugAction.def:
        _string =
            strings.pages.inputPage.alerts.explanation.defaultJugState(context);
        break;
    }
    _string = '$_string \n' +
        strings.pages.inputPage.alerts.explanation
            .state(context, [pair.jugState.clearState()]);
    return _string;
  }
}
