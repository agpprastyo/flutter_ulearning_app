import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        final emailAddress = state.email;
        final password = state.password;
        if (emailAddress.isEmpty) {
//
          toastInfo(message: 'You need to fill your email address');
          print('email empty');
          return;
        } else {
          print('email is $emailAddress');
        }
        if (password.isEmpty) {
//
          toastInfo(message: 'You need to fill your password');
          print('password empty');
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            toastInfo(message: 'You\'re email address does not exist');
            print('user does not exist');
          }
          if (!credential.user!.emailVerified) {
            //
            toastInfo(message: 'You\'re email address is not verified');
            print('email not verified');
            return;
          }

          var user = credential.user;
          if (user != null) {
            print('user is $user');
            // we got verified from firebase
          } else {
            toastInfo(message: 'You\'re email address does not exist');
            print('no user');
            return;
            //
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            //
            toastInfo(message: 'No user for that email address');
            print('user not found');
            return;
          } else if (e.code == 'wrong-password') {
            //
            toastInfo(message: 'Wrong password');
            print('wrong password');
            return;
          } else if (e.code == 'invalid-email') {
            //
            toastInfo(message: 'Invalid email');
            print('invalid email');
            return;
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
