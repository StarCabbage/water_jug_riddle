import 'package:water_jug_riddle/uitls/jug_solver/jug_actions.dart';
import 'package:water_jug_riddle/uitls/jug_solver/jug_state.dart';

class ActionJugStatePair {
  final JugAction jugAction;
  final JugState jugState;

  ActionJugStatePair(this.jugAction, this.jugState);

  @override
  String toString() {
    return 'ActionJugStatePair($jugAction, $jugState)';
  }
}
