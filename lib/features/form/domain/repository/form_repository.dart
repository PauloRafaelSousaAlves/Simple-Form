import 'package:simple_form/features/form/domain/entity/form_entity.dart';

abstract class FormRepository {
  Future<bool> call(FormEntity formEntity);
}
