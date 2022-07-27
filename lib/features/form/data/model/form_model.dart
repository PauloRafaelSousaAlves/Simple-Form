import 'package:simple_form/features/form/domain/entity/form_entity.dart';
import 'package:simple_form/share/base/model/model.dart';

class FormModel extends FormEntity implements Model {
  FormModel(
    super.name,
    super.lastName,
    super.age,
    super.gender,
    super.schooling,
    super.job,
    super.lifeGoal,
  );

  factory FormModel.copy(FormEntity formEntity) {
    return FormModel(
      formEntity.name,
      formEntity.lastName,
      formEntity.age,
      formEntity.gender,
      formEntity.schooling,
      formEntity.job,
      formEntity.lifeGoal,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    map['name'] = name;
    map['lastName'] = lastName;
    map['age'] = age;
    map['gender'] = gender;
    map['schooling'] = schooling;
    map['job'] = job;
    map['lifeGoal'] = lifeGoal;

    return map;
  }
}
