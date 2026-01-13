import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:topup_app/features/topup/data/datasources/topup_remote_datasource.dart';
import 'package:topup_app/features/topup/data/repositories/topup_repository_impl.dart';
import 'package:topup_app/features/topup/domain/repositories/topup_respository.dart';
import 'package:topup_app/features/topup/domain/usecases/create_topup.dart';
import 'package:topup_app/features/topup/presentation/bloc/account/account_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_form/topup_form_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerFactory(() => TopupBloc(serviceLocator()));
  serviceLocator.registerFactory(() => AccountBloc());
  serviceLocator.registerFactory(() => TopupFormBloc());
  serviceLocator.registerFactory(() => CreateTopup(serviceLocator()));
  serviceLocator.registerFactory<TopupRespository>(
    () => TopupRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory<TopupRemoteDatasource>(
    () => TopupRemoteDatasource(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(() => http.Client());
}
