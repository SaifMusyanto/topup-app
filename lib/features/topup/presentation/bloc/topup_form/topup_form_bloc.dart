import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_form/topup_form_event.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_form/topup_form_state.dart';

class TopupFormBloc extends Bloc<TopupFormEvent, TopupFormState> {
  TopupFormBloc() : super(const TopupFormState()) {
    on<TopupAmountChanged>((event, emit) async {
      emit(state.copyWith(amount: event.amount));
    });
    on<TopupCurrencyChanged>((event, emit) {
      emit(state.copyWith(currency: event.currency));
    });
    on<TopupCardNumberChanged>((event, emit) {
      emit(state.copyWith(cardNumber: event.cardNumber));
    });
    on<TopupCvvChanged>((event, emit) {
      emit(state.copyWith(cvv: event.cvv));
    });
    on<TopupExpiryMonthChanged>((event, emit) {
      emit(state.copyWith(expiryMonth: event.expiryMonth));
    });
    on<TopupExpiryYearChanged>((event, emit) {
      emit(state.copyWith(expiryYear: event.expiryYear));
    });
  }
}
