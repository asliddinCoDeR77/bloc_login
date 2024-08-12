import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  final String username;

  LoginUsernameChanged(String updatedUsername, {required this.username});

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(String updatedPassword, {required this.password});

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {}
