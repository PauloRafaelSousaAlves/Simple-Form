import 'dart:async';

import 'package:simple_form/design_system/radio_group/item.dart';

class RadioGroupBloc {
  StreamController<Item> controller = StreamController();
  Stream<Item> get stream => controller.stream;


  onValueChanged(Item value) {
    controller.sink.add(value);
  }
  dispose() {
    controller.close();
  }
}
