import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_form/design_system/app_bar/app_bar_widget.dart';
import 'package:simple_form/design_system/button/button.dart';
import 'package:simple_form/design_system/color/ds_colors.dart';
import 'package:simple_form/design_system/radio_group/item.dart';
import 'package:simple_form/design_system/radio_group/radio_group_widget.dart';
import 'package:simple_form/design_system/sized_box/sized_box_component.dart';
import 'package:simple_form/presenter/form/bloc/form_bloc.dart';

class FormDisplay extends StatefulWidget {
  const FormDisplay({Key? key}) : super(key: key);

  static const routeName = '/form_display';

  @override
  State<FormDisplay> createState() => _FormDisplayState();
}

class _FormDisplayState extends State<FormDisplay> {
  final bloc = GetIt.I<FormBloc>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        backgroundColor: DSColors.blueGrey60,
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
                  'Email :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: DSColors.red60,
                  ),
                ),
                SizedBoxComponent.verticalSpaceS12,
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu email.',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: DSColors.black30,
                      ),
                    ),
                  ),
                  onChanged: (value) => bloc.email = value,
                  validator: (value) {
                    if (value!.isEmpty) {}
                    return null;
                  },
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
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu nome.',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: DSColors.black30,
                      ),
                    ),
                  ),
                  onChanged: (value) => bloc.name = value,
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
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu sobrenome.',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: DSColors.black30,
                      ),
                    ),
                  ),
                  onChanged: (value) => bloc.lastName = value,
                  validator: (value) {
                    if (value!.isEmpty) {}
                    return null;
                  },
                ),
                SizedBoxComponent.verticalSpaceS24,
                const Text(
                  'Idade :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: DSColors.red60,
                  ),
                ),
                SizedBoxComponent.verticalSpaceS12,
                TextFormField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Digite sua idade.',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: DSColors.black30,
                      ),
                    ),
                  ),
                  onChanged: (value) => bloc.age = value,
                  validator: (value) {
                    if (value!.isEmpty) {}
                    return null;
                  },
                ),
                SizedBoxComponent.verticalSpaceS24,
                StreamBuilder(
                  stream: bloc.validatedFieldsStream,
                  builder: (context, snapshot) {
                    final radioGroup = RadioGroupWidget(
                      title: 'Genero Sexual :',
                      items: bloc.genderItems,
                      onValueChanged: (item) {
                        onGender(item);
                      },
                    );
                    return radioGroup;
                  },
                ),
                SizedBoxComponent.verticalSpaceS24,
                const Text(
                  'Emprego atual :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: DSColors.red60,
                  ),
                ),
                SizedBoxComponent.verticalSpaceS12,
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu emprego atual.',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: DSColors.black30,
                      ),
                    ),
                  ),
                  onChanged: (value) => bloc.job = value,
                  validator: (value) {
                    if (value!.isEmpty) {}
                    return null;
                  },
                ),
                SizedBoxComponent.verticalSpaceS24,
                RadioGroupWidget(
                  title: 'Sua Escolaridade :',
                  items: bloc.schoolingItems,
                  onValueChanged: (item) => onSchooling(item),
                ),
                SizedBoxComponent.verticalSpaceS24,
                const Text(
                  'Objetivo de vida :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: DSColors.red60,
                  ),
                ),
                SizedBoxComponent.verticalSpaceS12,
                TextFormField(
                  maxLength: 1000,
                  maxLines: 7,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Me conte sobre seu objetivo para a vida.',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: DSColors.black30,
                      ),
                    ),
                  ),
                  onChanged: (value) => bloc.lifeGoal = value,
                  validator: (value) {
                    if (value!.isEmpty) {}
                    return null;
                  },
                ),
                SizedBoxComponent.verticalSpaceS24,
                AppButton(
                  color: DSColors.blueGrey60,
                  enable: true,
                  enableBorder: true,
                  height: 40,
                  text: 'Enviar',
                  textColor: DSColors.black,
                  icon: const Icon(Icons.email),
                  paddingIcon: const EdgeInsets.only(right: 8),
                  onTap: onVerifyFields,
                ),
                SizedBoxComponent.verticalSpaceS28,
              ],
            ),
          ),
        ),
      ),
    );
  }

  onGender(Item item) {
    bloc.onGender(item);
  }

  onSchooling(Item item) {
    bloc.onSchooling(item);
  }

  void onVerifyFields() async {
    if (formKey.currentState?.validate() == true &&
        await bloc.verifyFields()) {}
  }
}
