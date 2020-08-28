import 'package:flutter/material.dart';
import 'package:fps/features/auth/signin.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
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
