import 'package:flutter/widgets.dart';
import 'package:simple_form/Denpedency_injection/injector.dart';

class Controller with ChangeNotifier {
  Controller();

  void loadDependencyInjection() {
    Injector()();
  }

  Future initialization(BuildContext? context) async {
    await Future.delayed(const Duration(seconds: 3));
  }

  call() async {
    loadDependencyInjection();

    initialization(null);
  }
}
