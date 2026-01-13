import 'package:equatable/equatable.dart';

sealed class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object?> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final String username;
  final int balance;
  final String currency;

  const AccountLoaded({
    required this.username,
    required this.balance,
    required this.currency,
  });

  AccountLoaded copyWith({String? username, int? balance, String? currency}) {
    return AccountLoaded(
      username: username ?? this.username,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
    );
  }

  @override
  List<Object?> get props => [username, balance, currency];
}

class AccountError extends AccountState {
  final String message;

  const AccountError(this.message);

  @override
  List<Object?> get props => [message];
}
