class TopupFormState {
  final String amount;
  final String? selectedCurrency;
  final String cardNumber;
  final String cvv;
  final String expiryMonth;
  final String expiryYear;
  final bool isFormValid;

  TopupFormState({
    this.amount = '',
    this.selectedCurrency,
    this.cardNumber = '',
    this.cvv = '',
    this.expiryMonth = '',
    this.expiryYear = '', 
    this.isFormValid = false, 
  });

  TopupFormState copyWith({
    String? amount,
    String? currency,
    String? cardNumber,
    String? cvv,
    String? expiryMonth,
    String? expiryYear,
    bool? isFormValid,
  }) {
    return TopupFormState(
      amount: amount ?? this.amount,
      selectedCurrency: currency ?? this.selectedCurrency,
      cardNumber: cardNumber ?? this.cardNumber,
      cvv: cvv ?? this.cvv,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      expiryYear: expiryYear ?? this.expiryYear,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
