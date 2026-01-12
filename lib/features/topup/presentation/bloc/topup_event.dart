import 'package:equatable/equatable.dart';
import 'package:topup_app/features/topup/domain/entities/card_details.dart';

abstract class TopupEvent extends Equatable {
  const TopupEvent();

  @override 
  List<Object?> get props => [];
}

class SubmitTopup extends TopupEvent {
  final int amount;
  final String currency;
  final CardDetails cardDetails;

  const SubmitTopup({
    required this.amount,
    required this.currency,
    required this.cardDetails,
  });

  @override
  List<Object?> get props => [
    amount,
    currency, 
    cardDetails
  ];
}
