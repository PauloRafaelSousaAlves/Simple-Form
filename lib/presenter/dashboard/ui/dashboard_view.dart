import 'package:flutter/material.dart';
import 'package:simple_form/design_system/app_bar/app_bar_widget.dart';
import 'package:simple_form/design_system/button/button.dart';
import 'package:simple_form/design_system/color/ds_colors.dart';
import 'package:simple_form/design_system/sized_box/sized_box_component.dart';
import 'package:simple_form/presenter/form/ui/form_display.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key}) : super(key: key);

  static const routeName = '/dashboard_view';

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        backgroundColor: DSColors.blueGrey60,
        title: 'Quem é você?',
        icon: Icon(
          Icons.assignment_ind_rounded,
          color: DSColors.black,
          size: 28,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '''Aplicativo destinado para o treinar o código na elaboração de um formulário para enviar ao email.

Nele iremos encontrar o preenchimento de alguns dados usando TextFormField e RadioList, ao final em clicar no botão enviar,
será redirecionado ao email padrão do celular, para a confirmação dos dados e enviar!''',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBoxComponent.verticalSpaceS24,
            AppButton(
              color: DSColors.blueGrey60,
              enable: true,
              enableBorder: true,
              text: 'Ir ao Formulário',
              height: 40,
              textColor: DSColors.black,
              onTap: () {
                Navigator.of(context).pushNamed(FormDisplay.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
