import 'dart:math';

import 'package:water_jug_riddle/uitls/jug_solver/jug_action_state_pair.dart';
import 'package:water_jug_riddle/uitls/jug_solver/jug_actions.dart';
import 'package:water_jug_riddle/uitls/jug_solver/jug_solution_model.dart';
import 'package:water_jug_riddle/uitls/jug_solver/jug_state.dart';

class Utils {
  static bool isMultiple(int a, int b) {
    if (b == 0) {
      return false;
    } else {
      return a % b == 0;
    }
  }

  static int gcd(int a, int b) {
    if (b == 0) {
      return a.abs();
    } else {
      return gcd(b, a % b);
    }
  }
}

abstract class RiddleSolver {
  static RiddleOutcome solve(int x, int y, int z) {
    if (!Utils.isMultiple(z, Utils.gcd(x, y))) {
      return NoSolution("Z is not multiple of gcd(X, Y).");
    } else if (max(x, y) < z) {
      return NoSolution("Z is greater than max(X, Y).");
    } else {
      final s1 = doSolve(x, y, z);
      final s2 = doSolve(y, x, z);
      if (s1.actions.length <= s2.actions.length) {
        return s1;
      } else {
        /// swap all elements inside [s2.states] with swap() method
        for (var i = 0; i < s2.states.length; i++) {
          s2.states[i] = s2.states[i].swap();
        }
        return Solution(s2.actions, s2.states);
      }
    }
  }

  static Solution doSolve(int x, int y, int z,
      {List<JugAction>? actions, List<JugState>? states}) {
    actions ??=  [JugAction.fill];
    states ??= [const JugState(0, 0), JugState(x, 0)];

    final int xCurrentState = states.last.x, yCurrentState = states.last.y;

    if (xCurrentState == z || yCurrentState == z) {
      return Solution(actions, states);
    } else {
      // Obtain maximum amount of water to be poured.
      final toBePoured = min(xCurrentState, y - yCurrentState);
      final xNew = xCurrentState - toBePoured;
      final yNew = yCurrentState + toBePoured;
      if (xNew == z || yNew == z) {
        return Solution(actions..add(JugAction.transfer),
            states..add(JugState(xNew, yNew)));
      } else {
        ActionJugStatePair? maybeFillX() {
          return xNew == 0
              ? ActionJugStatePair(JugAction.fill, JugState(x, yNew))
              : null;
        }

        ActionJugStatePair? maybeEmptyY() {
          return yNew == y
              ? ActionJugStatePair(JugAction.empty, JugState(xNew, 0))
              : null;
        }

        var pairFillX = maybeFillX();
        var pairEmptyY = maybeEmptyY();
        actions.add(JugAction.transfer);
        states.add(JugState(xNew, yNew));
        if (pairFillX != null) {
          actions.add(pairFillX.jugAction);
          states.add(pairFillX.jugState);
        }
        if (pairEmptyY != null) {
          actions.add(pairEmptyY.jugAction);
          states.add(pairEmptyY.jugState);
        }

        return doSolve(x, y, z, actions: actions, states: states);
      }
    }
  }
}
