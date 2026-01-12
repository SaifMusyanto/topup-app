import 'package:equatable/equatable.dart';

class CardDetails extends Equatable {
  final String cardNumber;
  final String expiryMonth;
  final String expiryYear;
  final String cvv;

  const CardDetails({
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvv,
  });

  @override
  List<Object?> get props => [
        cardNumber,
        expiryMonth,
        expiryYear,
        cvv,
      ];
}
