part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInUser implements AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  SignInUser({
    @required this.email,
    @required this.password,
    @required this.context,
  });
}

class SignUpUser implements AuthEvent {
  final String email;
  final String password;
  final String companyName;
  final BuildContext context;

  SignUpUser({
    @required this.email,
    @required this.password,
    @required this.companyName,
    @required this.context,
  });
}
