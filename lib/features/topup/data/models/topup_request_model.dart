import 'package:topup_app/features/topup/data/models/card_details_model.dart';
import 'package:topup_app/features/topup/domain/entities/topup_request.dart';

class TopupRequestModel extends TopupRequest {
  const TopupRequestModel({
    required super.amount,
    required super.currency,
    required CardDetailsModel cardDetailsModel,
  }) : super(cardDetails: cardDetailsModel);

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'card_details': (cardDetails as CardDetailsModel).toJson(),
    };
  }
}
