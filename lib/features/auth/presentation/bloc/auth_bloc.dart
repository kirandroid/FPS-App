import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignInUser) {
      yield AuthLoading();
      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email.trim(),
          password: event.password.trim(),
        );

        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('user')
            .doc(userCredential.user.uid)
            .get();

        if (userDoc.get("verified") == true) {
          yield AuthSuccess();
          ExtendedNavigator.of(event.context)
              .pushAndRemoveUntil(Routes.dashboardScreen, (route) => false);
        } else {
          yield AuthError(message: "User Not Verified");
          Toast().showToast(
            bgColor: UIColors.red,
            context: event.context,
            title: 'User Not Verified',
            message: 'Error',
          );
        }
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
          email: event.email.trim(),
          password: event.password.trim(),
        );

        await FirebaseFirestore.instance
            .collection("user")
            .doc(userCredential.user.uid)
            .set({"verified": false});

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

  @override
  AuthState get initialState => AuthInitial();
}
