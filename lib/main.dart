import 'package:flutter/material.dart';
import 'package:simple_form/app/app.dart';
import 'package:simple_form/app/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Controller ctrl = Controller();
  ctrl;

  runApp(App(controller: ctrl));
}
