import 'package:simple_form/features/form/data/datasource/form_datasource.dart';
import 'package:simple_form/features/form/data/model/form_model.dart';
import 'package:simple_form/features/form/domain/entity/form_entity.dart';
import 'package:simple_form/features/form/domain/repository/form_repository.dart';

class FormRepositoryImpl implements FormRepository {
  final FormDatasource datasource;

  FormRepositoryImpl(this.datasource);

  @override
  Future<bool> call(FormEntity formEntity) async {
    final params = FormModel.copy(formEntity).toMap();

    return await datasource(param: params);
  }
}