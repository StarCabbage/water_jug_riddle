import 'package:diffutil_sliverlist/diffutil_sliverlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:water_jug_riddle/constants/constants.dart';
import 'package:water_jug_riddle/constants/duration_constants.dart';

class SliverListStepWidget<T> extends StatelessWidget {
  final List<T> steps;
  final Duration pause;
  final Widget Function(BuildContext, T) builder;

  const SliverListStepWidget(
      {Key? key,
      required this.builder,
      this.steps = const [],
      this.pause = ConstantsDuration.sliverListElementPauseDefault})
      : super(key: key);

  Stream<List<T>> stepEmitterStream() async* {
    for (var i = 0; i < steps.length; i++) {
      await Future.delayed(pause);
      yield steps.sublist(0, i + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<T>>(
      stream: stepEmitterStream(),
      builder: (BuildContext context, AsyncSnapshot<List<T>> snapshot) {
        return DiffUtilSliverList<T>(
          items: steps.isNotEmpty ? snapshot.data ?? [] : [],
          builder: builder,
          insertAnimationBuilder: ConstantsAnimation.sliverListAnimation,
          removeAnimationBuilder: ConstantsAnimation.sliverListAnimation,
        );
      },
    );
  }
}
