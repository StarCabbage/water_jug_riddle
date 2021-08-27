// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Input on _Input, Store {
  Computed<int?>? _$jugXComputed;

  @override
  int? get jugX =>
      (_$jugXComputed ??= Computed<int?>(() => super.jugX, name: '_Input.jugX'))
          .value;
  Computed<int?>? _$jugYComputed;

  @override
  int? get jugY =>
      (_$jugYComputed ??= Computed<int?>(() => super.jugY, name: '_Input.jugY'))
          .value;
  Computed<int?>? _$jugZComputed;

  @override
  int? get jugZ =>
      (_$jugZComputed ??= Computed<int?>(() => super.jugZ, name: '_Input.jugZ'))
          .value;

  final _$_jugXAtom = Atom(name: '_Input._jugX');

  @override
  int get _jugX {
    _$_jugXAtom.reportRead();
    return super._jugX;
  }

  @override
  set _jugX(int value) {
    _$_jugXAtom.reportWrite(value, super._jugX, () {
      super._jugX = value;
    });
  }

  final _$_jugYAtom = Atom(name: '_Input._jugY');

  @override
  int get _jugY {
    _$_jugYAtom.reportRead();
    return super._jugY;
  }

  @override
  set _jugY(int value) {
    _$_jugYAtom.reportWrite(value, super._jugY, () {
      super._jugY = value;
    });
  }

  final _$_jugZAtom = Atom(name: '_Input._jugZ');

  @override
  int get _jugZ {
    _$_jugZAtom.reportRead();
    return super._jugZ;
  }

  @override
  set _jugZ(int value) {
    _$_jugZAtom.reportWrite(value, super._jugZ, () {
      super._jugZ = value;
    });
  }

  final _$isSolutionComputedAtom = Atom(name: '_Input.isSolutionComputed');

  @override
  bool get isSolutionComputed {
    _$isSolutionComputedAtom.reportRead();
    return super.isSolutionComputed;
  }

  @override
  set isSolutionComputed(bool value) {
    _$isSolutionComputedAtom.reportWrite(value, super.isSolutionComputed, () {
      super.isSolutionComputed = value;
    });
  }

  final _$solutionExistAtom = Atom(name: '_Input.solutionExist');

  @override
  bool get solutionExist {
    _$solutionExistAtom.reportRead();
    return super.solutionExist;
  }

  @override
  set solutionExist(bool value) {
    _$solutionExistAtom.reportWrite(value, super.solutionExist, () {
      super.solutionExist = value;
    });
  }

  final _$numberOfStepsAtom = Atom(name: '_Input.numberOfSteps');

  @override
  int get numberOfSteps {
    _$numberOfStepsAtom.reportRead();
    return super.numberOfSteps;
  }

  @override
  set numberOfSteps(int value) {
    _$numberOfStepsAtom.reportWrite(value, super.numberOfSteps, () {
      super.numberOfSteps = value;
    });
  }

  @override
  String toString() {
    return '''
isSolutionComputed: ${isSolutionComputed},
solutionExist: ${solutionExist},
numberOfSteps: ${numberOfSteps},
jugX: ${jugX},
jugY: ${jugY},
jugZ: ${jugZ}
    ''';
  }
}
