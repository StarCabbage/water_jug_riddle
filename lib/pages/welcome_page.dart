import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug_riddle/constants/constants.dart';
import 'package:water_jug_riddle/generated_resources/gen_extensions/generated_str_extension.dart';
import 'package:water_jug_riddle/stores/welcome_store/welcome_store.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final welcome = Provider.of<Welcome>(context);
    Widget widget = TextButton(
        onPressed: () => welcome.move2NextPage(context),
        child: Text(strings.pages.welcomePage.startButtonText.l(context)));
    widget = ShakeAnimatedWidget(
      enabled: true,
      duration: ConstantsDuration.shakeButton,
      shakeAngle: Rotation.deg(z: 20),
      curve: Curves.linear,
      child: widget,
    );
    return Material(child: Center(child: widget));
  }
}
