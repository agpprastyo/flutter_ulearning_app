part of 'sign_in_bloc.dart';

class SignInState {
  final String email;
  final String password;

  SignInState({
    this.email = '',
    this.password = '',
  });
  
  // copyWith() is a method that returns a new instance of the class with the
  // updated values.
  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
