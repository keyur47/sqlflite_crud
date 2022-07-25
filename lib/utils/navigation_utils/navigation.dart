import 'package:get/get.dart';
import 'package:sqlflite_crud/screen/display_contact/display_contact_screen.dart';
import 'package:sqlflite_crud/screen/home/home_screen.dart';
import 'package:sqlflite_crud/screen/update_contact/update_contact_screen.dart';

Transition defaultTransitions = Transition.native;

class Routes {
  static const home = '/home';
  static const displayContact = '/displayContact';
  static const updateContact = '/updateContact';

  static final route = [
    GetPage(name: home, page: () => Home(), transition: defaultTransitions),
    GetPage(
        name: displayContact,
        page: () => DisplayContact(),
        transition: defaultTransitions),
    GetPage(
        name: updateContact,
        page: () => UpdateContact(),
        transition: defaultTransitions),
  ];
}
