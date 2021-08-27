/*Внимание! В данном файле нельзя производить изменения вручную. Т.к. генератор просто удалит их.
              Используйте плагин flutter_serve для внесения изменений: flutter pub run flutter_serve*/

class Global {
  ///Water Jug Riddle. By YKapustin
  String get appName => "global.app_name"; /*Water Jug Riddle. By YKapustin*/
}

class Pages {
  WelcomePage get welcomePage => WelcomePage();
  InputPage get inputPage => InputPage();
}

class WelcomePage {
  ///Start
  String get startButtonText =>
      "pages.welcome_page.start_button_text"; /*Start*/
}

class InputPage {
  Forms get forms => Forms();
  Alerts get alerts => Alerts();
  ErrorAlerts get errorAlerts => ErrorAlerts();
}

class Forms {
  ///Enter gallons for Jug X:
  String get jugXFieldHint =>
      "pages.input_page.forms.jug_x_field_hint"; /*Enter gallons for Jug X: */
  ///Enter gallons for Jug Y:
  String get jugYFieldHint =>
      "pages.input_page.forms.jug_y_field_hint"; /*Enter gallons for Jug Y: */
  ///Enter the gallons you want to measure (Z):
  String get jugZFieldHint =>
      "pages.input_page.forms.jug_z_field_hint"; /*Enter the gallons you want to measure (Z): */
}

class Alerts {
  ///Pls, enter all of jug values
  String get invitationToInputJugValues =>
      "pages.input_page.alerts.invitation_to_input_jug_values"; /*Pls, enter all of jug values*/
  ///Great!
  String get jugGreatValueAlert =>
      "pages.input_page.alerts.jug_great_value_alert"; /*Great!*/
  ///Solution found!
  String get solutionFoundAlert =>
      "pages.input_page.alerts.solution_found_alert"; /*Solution found!*/
  ///There is no solution :(
  String get noSolution =>
      "pages.input_page.alerts.no_solution"; /*There is no solution :(*/
  ///Number of steps: {}
  String get numberOfStepsAlert =>
      "pages.input_page.alerts.number_of_steps_alert"; /*Number of steps: {}*/
  ///Everything is possible let me show you.
  String get everythingIsPossibleAlert =>
      "pages.input_page.alerts.everything_is_possible_alert"; /*Everything is possible let me show you.*/
  ///Action: {}
  String get action => "pages.input_page.alerts.action"; /*Action: {}*/
  Explanation get explanation => Explanation();
}

class Explanation {
  ///Fill bucket {}
  String get fillBucket =>
      "pages.input_page.alerts.explanation.fill_bucket"; /*Fill bucket {}*/
  ///Transfer bucket {} to bucket {}
  String get transferBucket =>
      "pages.input_page.alerts.explanation.transfer_bucket"; /*Transfer bucket {} to bucket {}*/
  ///Dump bucket {}
  String get dumpBucket =>
      "pages.input_page.alerts.explanation.dump_bucket"; /*Dump bucket {}*/
  ///Details: {}
  String get details =>
      "pages.input_page.alerts.explanation.details"; /*Details: {}*/
  ///Default jug state
  String get defaultJugState =>
      "pages.input_page.alerts.explanation.default_jug_state"; /*Default jug state*/
  ///State: {}
  String get state => "pages.input_page.alerts.explanation.state"; /*State: {}*/
}

class ErrorAlerts {
  ///Sorry. Max Gallons for jug is less than 5000
  String get jugMaxAlert =>
      "pages.input_page.error_alerts.jug_max_alert"; /*Sorry. Max Gallons for jug is less than 5000*/
  ///Sorry. Gallons can't be in float, pls enter gallons with int type
  String get jugDoubleAlert =>
      "pages.input_page.error_alerts.jug_double_alert"; /*Sorry. Gallons can't be in float, pls enter gallons with int type*/
  ///Sorry. Min Gallons for Jug is more or equal than 0
  String get jugMinAlert =>
      "pages.input_page.error_alerts.jug_min_alert"; /*Sorry. Min Gallons for Jug is more or equal than 0*/
  ///Pls, enter some value between 0 and 5000
  String get invitationToInputJugValue =>
      "pages.input_page.error_alerts.invitation_to_input_jug_value"; /*Pls, enter some value between 0 and 5000*/
}
