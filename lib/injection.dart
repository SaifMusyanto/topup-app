import 'package:topup_app/features/topup/data/datasources/topup_remote_datasource.dart';
import 'package:topup_app/features/topup/data/repositories/topup_repository_impl.dart';
import 'package:topup_app/features/topup/domain/usecases/create_topup.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc.dart';
import 'package:http/http.dart' as http;

TopupBloc createTopupBloc() {
  final client = http.Client();
  final datasource = TopupRemoteDatasource(client);
  final repository = TopupRepositoryImpl(datasource);
  final usecase = CreateTopup(repository);

  return TopupBloc(usecase);
}