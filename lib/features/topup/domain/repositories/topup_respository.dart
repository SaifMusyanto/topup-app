import 'package:topup_app/features/topup/domain/entities/topup_request.dart';

abstract class TopupRespository {
  Future<String> createTopup(TopupRequest request);
}
