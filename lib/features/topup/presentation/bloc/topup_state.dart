abstract class TopupState {}

class TopupInitial extends TopupState {}

class TopupLoading extends TopupState {}

class TopupSuccess extends TopupState {
  final String invoiceUrl;
  final int amount;
  TopupSuccess(this.invoiceUrl, this.amount);
}

class TopupError extends TopupState {
  final String message;
  TopupError(this.message);
}
