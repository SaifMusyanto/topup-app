abstract class TopupFormEvent {}

class AmountChanged extends TopupFormEvent {
  final String amount;
  AmountChanged(this.amount);
}

class SelectedCurrencyChanged extends TopupFormEvent {
  final String selectedCurrency;
  SelectedCurrencyChanged(this.selectedCurrency);
}

class CardNumberChanged extends TopupFormEvent {
  final String cardNumber;
  CardNumberChanged(this.cardNumber);
}

class CvvChanged extends TopupFormEvent {
  final String cvv;
  CvvChanged(this.cvv);
}

class ExpiryMonthChanged extends TopupFormEvent {
  final String expiryMonth;
  ExpiryMonthChanged(this.expiryMonth);
}

class ExpiryYearChanged extends TopupFormEvent {
  final String expiryYear;
  ExpiryYearChanged(this.expiryYear);
}

class FormValidityChanged extends TopupFormEvent {
  final bool isFormValid;
  FormValidityChanged(this.isFormValid);
}
