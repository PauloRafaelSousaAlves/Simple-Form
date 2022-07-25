import 'package:flutter/material.dart';
import 'package:simple_form/design_system/app_bar/app_bar_widget.dart';
import 'package:simple_form/design_system/color/ds_colors.dart';
import 'package:simple_form/design_system/sized_box/sized_box_component.dart';

class FormDisplay extends StatefulWidget {
  const FormDisplay({Key? key}) : super(key: key);

  static const routeName = '/form_display';

  @override
  State<FormDisplay> createState() => _FormDisplayState();
}

class _FormDisplayState extends State<FormDisplay> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          backgroundColor: DSColors.red,
          title: 'Formulário Simples',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '''Preencha o formulário com seus dados''',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBoxComponent.verticalSpaceS24,
                  const Text(
                    'Nome :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: DSColors.red60,
                    ),
                  ),
                  SizedBoxComponent.verticalSpaceS12,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Digite seu nome',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: DSColors.black30,
                        ),
                      ),
                    ),
                    // onChanged: ,
                    validator: (value) {
                      if (value!.isEmpty) {}
                      return null;
                    },
                  ),
                  SizedBoxComponent.verticalSpaceS24,
                  const Text(
                    'Sobrenome :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: DSColors.red60,
                    ),
                  ),
                  SizedBoxComponent.verticalSpaceS12,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Digite seu sobrenome',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: DSColors.black30,
                        ),
                      ),
                    ),
                    // onChanged: ,
                    validator: (value) {
                      if (value!.isEmpty) {}
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
