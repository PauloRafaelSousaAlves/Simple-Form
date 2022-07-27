import 'package:simple_form/features/form/domain/entity/form_entity.dart';
import 'package:simple_form/features/form/domain/repository/form_repository.dart';

abstract class FormUseCase {
  Future<bool> call(FormEntity formEntity);
}

class FormUseCaseImpl implements FormUseCase {
  final FormRepository repository;

  FormUseCaseImpl(this.repository);

  @override
  Future<bool> call(FormEntity formEntity) async {
    return await repository(formEntity);
  }
}
