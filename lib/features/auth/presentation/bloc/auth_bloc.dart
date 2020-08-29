import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fps/core/routes/router.gr.dart';
import 'package:fps/core/utils/app_config.dart';
import 'package:fps/core/utils/colors.dart';
import 'package:fps/core/utils/toast.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignInUser) {
      yield AuthLoading();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        yield AuthSuccess();
        ExtendedNavigator.of(event.context)
            .pushAndRemoveUntil(Routes.dashboardScreen, (route) => false);
      } catch (e) {
        if (e.code == "invalid-email" ||
            e.code == 'wrong-password' ||
            e.code == 'user-not-found') {
          yield AuthError(message: "Invalid Credentials");
          Toast().showToast(
            bgColor: UIColors.red,
            context: event.context,
            title: 'Invalid Credentials',
            message: 'Error',
          );
        } else {
          yield AuthError(message: "System Failure");
          Toast().showToast(
            bgColor: UIColors.red,
            context: event.context,
            title: 'System Failure',
            message: 'Error',
          );
        }
      }
    } else if (event is SignUpUser) {
      yield AuthLoading();
      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        await AppConfig.runTransaction(
            functionName: 'createNewCompany',
            parameter: [userCredential.user.uid, event.companyName]);
        yield AuthSuccess();
        ExtendedNavigator.of(event.context).pop();
      } catch (e) {
        if (e.code == "email-already-in-use") {
          yield AuthError(message: "Account Already Exists");
          Toast().showToast(
            bgColor: UIColors.red,
            context: event.context,
            title: 'Account Already Exists',
            message: 'Error',
          );
        } else {
          yield AuthError(message: "System Failure");
          Toast().showToast(
            bgColor: UIColors.red,
            context: event.context,
            title: 'System Failure',
            message: 'Error',
          );
        }
      }
    }
  }
}
