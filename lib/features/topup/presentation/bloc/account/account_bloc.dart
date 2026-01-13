import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topup_app/features/topup/presentation/bloc/account/account_event.dart';
import 'package:topup_app/features/topup/presentation/bloc/account/account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<LoadAccountInfo>(_onLoadAccountInfo);
    on<RefreshBalance>(_onRefreshBalance);
  }

  Future<void> _onLoadAccountInfo(
    LoadAccountInfo event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());
    try {
      emit(
        const AccountLoaded(username: 'Tinossss', balance: 1, currency: 'USD'),
      );
    } catch (e) {
      emit(AccountError('Gagal memuat data akun: $e'));
    }
  }

  void _onRefreshBalance(RefreshBalance event, Emitter<AccountState> emit) {
    if (state is AccountLoaded) {
      final currentState = state as AccountLoaded;

      emit(currentState.copyWith(balance: event.newBalance));
    }
  }
}
