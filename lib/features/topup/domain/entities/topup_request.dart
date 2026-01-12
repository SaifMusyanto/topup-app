import 'package:equatable/equatable.dart';
import 'package:topup_app/features/topup/domain/entities/card_details.dart';

class TopupRequest extends Equatable {
  final int amount;
  final String currency;
  final CardDetails cardDetails;

  const TopupRequest({
    required this.amount,
    required this.currency,
    required this.cardDetails,
  });

  @override
  List<Object?> get props => [
        amount,
        currency,
        cardDetails,
  ];
}
