part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckLoggingInEvent extends AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final SignInEntity signInEntity;
  SignInEvent({required this.signInEntity});
  @override
  List<Object> get props => [signInEntity];
}

class SignUpEvent extends AuthEvent {
  final SignUpEntity signUpEntity;
  SignUpEvent({required this.signUpEntity});
  @override
  List<Object> get props => [signUpEntity];
}

class GetNameEvent extends AuthEvent {
  final String uid;
  GetNameEvent({required this.uid});
  @override
  List<Object> get props => [uid];
}
