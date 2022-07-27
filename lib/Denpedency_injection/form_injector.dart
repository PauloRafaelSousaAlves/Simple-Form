import 'package:get_it/get_it.dart';
import 'package:simple_form/features/form/domain/usecase/form_usecase.dart';
import 'package:simple_form/presenter/form/bloc/form_bloc.dart';

class FormInjector {
  call() {
    GetIt.I.registerLazySingleton<FormBloc>(
        () => FormBloc(GetIt.I<FormUseCase>()));
  }
}
