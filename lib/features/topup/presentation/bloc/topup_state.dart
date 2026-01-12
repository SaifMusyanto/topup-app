abstract class TopupState {}

class TopupInitial extends TopupState {}

class TopupLoading extends TopupState {}

class TopupSuccess extends TopupState {
  final String invoiceUrl;
  TopupSuccess(this.invoiceUrl);
}

class TopupError extends TopupState {
  final String message;
  TopupError(this.message);
}