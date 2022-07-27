import 'package:simple_form/share/base/datasource/datasource.dart';

abstract class FormDatasource implements DataSource<bool> {}

class FormDatasourceImpl implements FormDatasource {
  @override
  Future<bool> call(
      {FromJson<bool>? fromJson, Map<String, dynamic>? param}) async {
    return true;
  }
}
