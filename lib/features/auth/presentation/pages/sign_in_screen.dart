import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fps/core/routes/router.gr.dart';
import 'package:fps/core/utils/colors.dart';
import 'package:fps/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fps/injection.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "fps",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 51,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text(
                          "Welcome",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text(
                          "Back",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: InkWell(
                          onTap: () {
                            getIt<AuthBloc>().add(
                              SignInUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.redAccent,
                            ),
                            child: Center(
                              child: state is AuthLoading
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      'Sign In',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: InkWell(
                          onTap: () {
                            ExtendedNavigator.of(context).pushSignUpScreen();
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                              // color: Color(0xffEC686F),
                            ),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Create an account?',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '  Sign Up',
                                  style: GoogleFonts.poppins(
                                    color: Color(0xff2A9D8F),
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
                ),
              ),
            );
          },
        ));
  }
}
