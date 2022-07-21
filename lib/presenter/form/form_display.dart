import 'package:flutter/material.dart';
import 'package:simple_form/design_system/color/ds_colors.dart';

class FormDisplay extends StatelessWidget {
  const FormDisplay({Key? key}) : super(key: key);

  static const routeName = '/formDisplay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 300,
        color: DSColors.blue,
      ),
    );
  }
}
