import 'package:topup_app/features/topup/domain/entities/card_details.dart';

class CardDetailsModel extends CardDetails {
  const CardDetailsModel({
    required super.cardNumber,
    required super.expiryMonth,
    required super.expiryYear,
    required super.cvv,
  });

  Map<String, dynamic> toJson() {
    return {
      'card_number': cardNumber,
      'expiry_month': expiryMonth,
      'expiry_year': expiryYear,
      'cvv': cvv,
    };
  }
}
