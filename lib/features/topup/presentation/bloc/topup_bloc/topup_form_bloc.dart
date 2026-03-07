import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc/topup_form_event.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_bloc/topup_form_state.dart';

class TopupFormBloc extends Bloc<TopupFormEvent, TopupFormState>{
  TopupFormBloc() : super(TopupFormState()) {
    if(state.isFormValid){
      on<AmountChanged>(
        (event, emit) => emit(state.copyWith(amount: event.amount)),
      );

      on<SelectedCurrencyChanged>(
        (event, emit) => emit(state.copyWith(currency: event.selectedCurrency)),
      );

      on<CardNumberChanged>(
        (event, emit) => emit(state.copyWith(cardNumber: event.cardNumber)),
      );

      on<CvvChanged>((event, emit) => emit(state.copyWith(cvv: event.cvv)));

      on<ExpiryMonthChanged>(
        (event, emit) => emit(state.copyWith(expiryMonth: event.expiryMonth)),
      );

      on<ExpiryYearChanged>(
        (event, emit) => emit(state.copyWith(expiryYear: event.expiryYear)),
      );
    }
    }
}

 