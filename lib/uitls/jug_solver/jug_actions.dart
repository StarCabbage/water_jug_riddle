enum JugAction { fill, empty, transfer, def }

extension ClipJugAction on JugAction {
  String clippedName() {
    if (this == JugAction.def) {
      return 'DefaultState';
    }
    return toString().replaceFirst('$JugAction.', '');
  }
}
