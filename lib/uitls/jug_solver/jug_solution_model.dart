import 'package:water_jug_riddle/uitls/jug_solver/jug_action_state_pair.dart';
import 'package:water_jug_riddle/uitls/jug_solver/jug_actions.dart';
import 'package:water_jug_riddle/uitls/jug_solver/jug_state.dart';

abstract class RiddleOutcome {}

class NoSolution extends RiddleOutcome {
  final String cause;

  NoSolution(this.cause);

  @override
  String toString() {
    return 'NoSolution($cause)';
  }
}

class Solution extends RiddleOutcome {
  final List<JugAction> actions;
  final List<JugState> states;

  Solution(this.actions, this.states);

  List<ActionJugStatePair> get pairs {
    var actions = [JugAction.def, ...this.actions];
    var _pairs = <ActionJugStatePair>[];
    for (var i = 0; i < states.length; i++) {
      _pairs.add(ActionJugStatePair(actions[i], states[i]));
    }
    return _pairs;
  }

  @override
  String toString() {
    return 'Solution($actions,$states)';
  }
}
