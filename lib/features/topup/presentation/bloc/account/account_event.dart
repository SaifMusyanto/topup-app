import 'package:equatable/equatable.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object?> get props => [];
}

class LoadAccountInfo extends AccountEvent {}

class RefreshBalance extends AccountEvent {
  final int newBalance;

  const RefreshBalance(this.newBalance);

  @override
  List<Object?> get props => [newBalance];
}
