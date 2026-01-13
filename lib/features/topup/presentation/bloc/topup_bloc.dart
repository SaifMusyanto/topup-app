import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topup_app/features/topup/domain/entities/topup_request.dart';
import 'package:topup_app/features/topup/domain/usecases/create_topup.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_event.dart';
import 'package:topup_app/features/topup/presentation/bloc/topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  final CreateTopup createTopup;

  TopupBloc(this.createTopup) : super(TopupInitial()) {
    on<SubmitTopup>((event, emit) async {
      emit(TopupLoading());

      try {
        // final url = await createTopup.execute(
        //   TopupRequest(
        //     amount: event.amount,
        //     currency: event.currency,
        //     cardDetails: event.cardDetails,
        //   ),
        // );
        final url = "https://example.com/invoice/12345"; // Mock URL

        emit(TopupSuccess(url, event.amount));
      } catch (e) {
        emit(TopupError('Topup failed: ${e.toString()}'));
      }
    });
  }
}
