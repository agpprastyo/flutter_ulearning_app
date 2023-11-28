import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  RegisterController(this.context);

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo(
        message:
            'Your ${username.isEmpty ? 'username' : email.isEmpty ? 'email' : password.isEmpty ? 'password' : 're-password'} is empty',
      );
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(message: 'Please check your email to verify your account');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        toastInfo(message: 'The email address is not valid.');
      }
    }
  }
}
