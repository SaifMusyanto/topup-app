import 'package:topup_app/features/topup/data/datasources/topup_remote_datasource.dart';
import 'package:topup_app/features/topup/data/models/card_details_model.dart';
import 'package:topup_app/features/topup/data/models/topup_request_model.dart';
import 'package:topup_app/features/topup/domain/entities/topup_request.dart';
import 'package:topup_app/features/topup/domain/repositories/topup_respository.dart';

class TopupRepositoryImpl implements TopupRespository {
  final TopupRemoteDatasource remote;

  TopupRepositoryImpl(this.remote);

  @override
  Future<String> createTopup(TopupRequest request) {
    final cardModel = CardDetailsModel(
      cardNumber: request.cardDetails.cardNumber,
      expiryMonth: request.cardDetails.expiryMonth,
      expiryYear: request.cardDetails.expiryYear,
      cvv: request.cardDetails.cvv,
    );
    
    final model = TopupRequestModel(
      amount: request.amount,
      currency: request.currency,
      cardDetailsModel: cardModel,
    );

    return remote.createTopup(model);
  }
}