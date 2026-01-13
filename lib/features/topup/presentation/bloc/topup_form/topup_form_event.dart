abstract class TopupFormEvent {}

class TopupAmountChanged extends TopupFormEvent {
  final String amount;
  TopupAmountChanged(this.amount);
}

class TopupCurrencyChanged extends TopupFormEvent {
  final String currency;
  TopupCurrencyChanged(this.currency);
}

class TopupCardNumberChanged extends TopupFormEvent {
  final String cardNumber;
  TopupCardNumberChanged(this.cardNumber);
}

class TopupCvvChanged extends TopupFormEvent {
  final String cvv;
  TopupCvvChanged(this.cvv);
}

class TopupExpiryMonthChanged extends TopupFormEvent {
  final String expiryMonth;
  TopupExpiryMonthChanged(this.expiryMonth);
}

class TopupExpiryYearChanged extends TopupFormEvent {
  final String expiryYear;
  TopupExpiryYearChanged(this.expiryYear);
}
