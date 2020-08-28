import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fps/core/routes/router.gr.dart';
import 'package:fps/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff335C67),
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                "asset/fps.png",
                height: 170,
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                'fake product scanner',
                style:
                    GoogleFonts.poppins(fontSize: 24, color: Colors.grey[300]),
              ),
              SizedBox(height: 30),
              Image.asset(
                "asset/logo1.png",
                height: 270,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: InkWell(
                onTap: () {
                  ExtendedNavigator.of(context).push(Routes.signInScreen);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.redAccent),
                  child: Center(
                      child: Text(
                    'let\'s get started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
