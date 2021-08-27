class JugState {
  final int x, y;

  const JugState(this.x, this.y);

  JugState swap() => JugState(y, x);

  @override
  String toString() {
    return 'JugState($x, $y)';
  }

  String clearState() {
    return '($x, $y)';
  }
}
