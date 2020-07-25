part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String uid;

  const AuthenticationSuccess(this.uid);

  @override
  List<Object> get props => [uid];

  @override
  String toString() => 'AuthenticationSuccess { uid: $uid }';
}

class AuthenticationFailure extends AuthenticationState {}
