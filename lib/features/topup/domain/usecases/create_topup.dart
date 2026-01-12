import 'package:topup_app/features/topup/domain/entities/topup_request.dart';
import 'package:topup_app/features/topup/domain/repositories/topup_respository.dart';

class CreateTopup {
  final TopupRespository repository;

  CreateTopup(this.repository);

  Future<String> execute(TopupRequest request) {
    return repository.createTopup(request);
  }
}
