import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topup_app/features/topup/domain/entities/topup_request.dart';
import 'package:topup_app/features/topup/domain/usecases/create_topup.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_event.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  final CreateTopup createTopup;

  TopupBloc(this.createTopup) : super(TopupInitial()) {
    on<SubmitTopup>((event, emit) async {
      print('Processing SubmitTopup event');
      emit(TopupLoading());

      try {
        final url = await createTopup.execute(
          TopupRequest(
            amount: event.amount,
            currency: event.currency,
            cardDetails: event.cardDetails,
          ),
        );

        print('Topup successful, URL: $url');
        emit(TopupSuccess(url));
      } catch (e) {
        print('Topup failed with error: $e');
        emit(TopupError('Topup failed: ${e.toString()}'));
      }
    });
  }

  @override
  void onTransition(Transition<TopupEvent, TopupState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onEvent(TopupEvent event) {
    super.onEvent(event);
    print('Event: $event');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('Error: $error');
  }
}
