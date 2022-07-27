import 'package:get_it/get_it.dart';
import 'package:simple_form/features/form/data/datasource/form_datasource.dart';
import 'package:simple_form/features/form/data/repository/form_repository_impl.dart';
import 'package:simple_form/features/form/domain/repository/form_repository.dart';
import 'package:simple_form/features/form/domain/usecase/form_usecase.dart';
import 'package:simple_form/presenter/form/bloc/form_bloc.dart';

class FormInjector {
  call() {
    GetIt.I.registerLazySingleton<FormBloc>(
        () => FormBloc(GetIt.I<FormUseCase>()));

    GetIt.I.registerFactory<FormDatasource>(
        () => FormDatasourceImpl());

    GetIt.I.registerFactory<FormRepository>(
      () => FormRepositoryImpl(GetIt.I<FormDatasource>()),
    );

    GetIt.I.registerFactory<FormUseCase>(
      () => FormUseCaseImpl(GetIt.I<FormRepository>()),
    );
  }
}
