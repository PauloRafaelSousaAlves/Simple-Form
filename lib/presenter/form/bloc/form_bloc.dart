import 'dart:async';
import 'package:simple_form/design_system/radio_group/item.dart';
import 'package:simple_form/features/form/domain/entity/form_entity.dart';
import 'package:simple_form/features/form/domain/usecase/form_usecase.dart';
import 'package:simple_form/share/boundaries/url_launcher/email.dart';
import 'package:simple_form/share/boundaries/url_launcher/url_launcher_facade_impl.dart';

class FormBloc {
  final FormUseCase formUseCase;

  FormBloc(this.formUseCase);

  final StreamController validatedFieldsController = StreamController();

  Stream get validatedFieldsStream => validatedFieldsController.stream;

  String? email;
  String? name;
  String? lastName;
  String? age;
  String? gender;
  String? job;
  String? schooling;
  String? lifeGoal;

  List<Item> genderItems = [
    Item(0, "Masculino"),
    Item(1, "Feminino"),
    Item(2, "Prefiro não falar"),
  ];

  List<Item> schoolingItems = [
    Item(0, "Ensino Fundamental Incompleto"),
    Item(1, "Ensino Fundamental Completo"),
    Item(2, "Ensino Médio Incompleto"),
    Item(3, "Ensino Médio Completo"),
    Item(4, "Ensino Superior Incompleto"),
    Item(5, "Ensino Superior Completo"),
  ];

  launchEmail(
    String adress,
    String subject,
    String body,
  ) async {
    final email = Email(
      adress,
      subject,
      body,
    );
    final urlLauncherFacade = UrlLauncherFacadeImpl();
    urlLauncherFacade(email: email);
  }

  void onGender(Item item) {
    gender = item.description;
  }

  void onSchooling(Item item) {
    schooling = item.description;
  }

  Future<bool> onSendFormMail() async {
    final formEntity = FormEntity(
      email ?? '',
      name ?? '',
      lastName ?? '',
      age ?? '',
      gender ?? '',
      job ?? '',
      schooling ?? '',
      lifeGoal ?? '',
    );

    if (await formUseCase(formEntity)) {
      String verify = 'Dados Pessoais!';
      launchEmail(
        'teste@hotmail.com.br',
        verify,
        formEntity.toEmailBody(),
      );
      return true;
    } else {
      return false;
    }
  }

  Future<bool> verifyFields() async {
    if (gender == null) {
      validatedFieldsController.sink.addError(true);
      return false;
    }

    return onSendFormMail();
  }
}
