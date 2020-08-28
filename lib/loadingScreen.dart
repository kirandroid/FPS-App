import 'package:flutter/material.dart';
import 'package:fps/signin.dart';

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
              Image.asset("asset/fpsText.png"),
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
                  height: 41,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffEC686F)),
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
