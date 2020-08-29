import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fps/core/utils/colors.dart';
import 'package:fps/core/utils/text_style.dart';
import 'package:fps/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fps/injection.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController companyNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: UIColors.primaryBackground,
              body: SafeArea(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "fps",
                            style: StyleText.popBold.copyWith(
                              color: UIColors.white60,
                              fontSize: 51,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text("Create",
                              style: StyleText.popBold.copyWith(
                                color: UIColors.white60,
                                fontSize: 32,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text("Account",
                              style: StyleText.popBold.copyWith(
                                color: UIColors.white60,
                                fontSize: 32,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 8),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: StyleText.popRegular.copyWith(
                                color: UIColors.white60,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 8),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: StyleText.popRegular.copyWith(
                                color: UIColors.white60,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 8),
                          child: TextFormField(
                            controller: companyNameController,
                            decoration: InputDecoration(
                              labelText: "Company Name",
                              labelStyle: StyleText.popRegular.copyWith(
                                color: UIColors.white60,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 16),
                          child: InkWell(
                            onTap: () {
                              getIt<AuthBloc>().add(
                                SignUpUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  companyName: companyNameController.text,
                                  context: context,
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.redAccent),
                              child: Center(
                                child: state is AuthLoading
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        'Sign Up',
                                        style: StyleText.popBold.copyWith(
                                          color: UIColors.white60,
                                          fontSize: 20,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 32),
                          child: InkWell(
                            onTap: () {
                              ExtendedNavigator.of(context).pop();
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Back to',
                                    style: StyleText.popRegular.copyWith(
                                      color: UIColors.white60,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '  Sign In',
                                    style: GoogleFonts.poppins(
                                      color: UIColors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
