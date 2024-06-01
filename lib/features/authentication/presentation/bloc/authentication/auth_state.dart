part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class EmailIsSentState extends AuthState {}

class SignedInPageState extends AuthState {}

class LoggedOutState extends AuthState {}

class SignedInState extends AuthState {}

class SignedUpState extends AuthState {}

class GoogleSignInState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String message;
  ErrorAuthState({required this.message});
  @override
  List<Object> get props => [message];
}

class GetNameState extends AuthState {
  final String name;
  GetNameState({required this.name});
  @override
  List<String> get props => [name];
}
