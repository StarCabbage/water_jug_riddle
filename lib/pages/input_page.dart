import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:water_jug_riddle/constants/constants.dart';
import 'package:water_jug_riddle/generated_resources/gen_extensions/generated_str_extension.dart';
import 'package:water_jug_riddle/stores/input_store/input_store.dart';
import 'package:water_jug_riddle/uitls/jug_solver/jug_lib.dart';
import 'package:water_jug_riddle/widgets/input_page_widgets/input_form_field_widget.dart';
import 'package:water_jug_riddle/widgets/sliver_list_step_widget.dart';

class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final input = Provider.of<Input>(context);

    ///Form fiels
    var jugXFormField = InputFormFieldWidget(
        strings.pages.inputPage.forms.jugXFieldHint.l(context),
        input.setJugX,
        input.validateJug(context),
        input.jugX);
    var jugYFormField = InputFormFieldWidget(
        strings.pages.inputPage.forms.jugYFieldHint.l(context),
        input.setJugY,
        input.validateJug(context),
        input.jugY);
    var jugZFormField = InputFormFieldWidget(
        strings.pages.inputPage.forms.jugZFieldHint.l(context),
        input.setJugZ,
        input.validateJug(context),
        input.jugZ,
        textInputAction: TextInputAction.done);

    var solutionObserver = Observer(builder: (BuildContext context) {
      var solutionString = strings.pages.inputPage.alerts.noSolution(context);
      var stepsCountString = '';
      if (input.solutionExist) {
        solutionString =
            strings.pages.inputPage.alerts.solutionFoundAlert(context);
        stepsCountString = strings.pages.inputPage.alerts
            .numberOfStepsAlert(context, [input.numberOfSteps]);
      }
      var solutionExistsWidget = ListTile(
          shape: ConstantsTheme.roundShape,
          onTap: () {},
          title: Text(solutionString),
          subtitle: Text(stepsCountString));

      return SliverToBoxAdapter(
        child: AnimatedSwitcher(
            duration: ConstantsDuration.animatedSwitcherDefault,
            child:
                input.isSolutionComputed ? solutionExistsWidget : Container()),
      );
    });
    var solutionObserverActionsList = Observer(builder: (context) {
      List<ActionJugStatePair> actionsList = [];
      if (input.solutionExist && input.solution != null) {
        actionsList = input.solution!.pairs;
      }

      return SliverListStepWidget<ActionJugStatePair>(
          steps: actionsList,
          builder: (BuildContext context, ActionJugStatePair pair) {
            String jugActionClippedName = pair.jugAction.clippedName();
            String detailsString = input.convert2HumanReadable(pair, context);

            detailsString = strings.pages.inputPage.alerts.explanation
                .details(context, [detailsString]);
            var action = strings.pages.inputPage.alerts
                .action(context, [jugActionClippedName]);
            return ListTile(
                shape: ConstantsTheme.roundShape,
                onTap: () {},
                title: Text(action),
                subtitle: Text(detailsString));
          });
    });
    return Material(child: SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        Widget widget = CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: jugXFormField),
            SliverToBoxAdapter(child: jugYFormField),
            SliverToBoxAdapter(child: jugZFormField),
            solutionObserver,
            SliverToBoxAdapter(child: space),
            solutionObserverActionsList,
          ],
        );
        if (constraints.maxHeight < constraints.maxWidth) {
          widget = SizedBox(
              child: widget,
              width: constraints.maxWidth * ConstantsTheme.kXSpacer);
        }
        widget = Center(child: Form(child: widget));
        return widget;
      }),
    ));
  }

  SizedBox get space => const SizedBox(height: ConstantsTheme.kSpacing);
}
