import 'package:auto_route/auto_route.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fps/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:fps/features/allProducts/presentation/widgets/productInfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ScanProductScreen extends StatefulWidget {
  ScanProductScreen({Key key}) : super(key: key);

  @override
  _ScanProductScreenState createState() => _ScanProductScreenState();
}

class _ScanProductScreenState extends State<ScanProductScreen> {
  String barcode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff335C67),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      ExtendedNavigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "fps",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 51,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: InkWell(
                      onTap: () {
                        ExtendedNavigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.exit_to_app,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(
                "Check",
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
                "Product Info",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // SizedBox(height: 60),
            Image.asset("asset/scanner.png"),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductInfo()));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.redAccent,
                  ),
                  child: Center(
                      child: Text(
                    'Scan Product',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future scan() async {
  //   try {
  //     String barcode = (await BarcodeScanner.scan()) as String;
  //     setState(() {
  //       this.barcode = barcode;
  //     });
  //   } on PlatformException catch (e) {
  //     if (e.code == BarcodeScanner.cameraAccessDenied) {
  //       setState(() {
  //         this.barcode = 'Camera Permission not granted';
  //       });
  //     }
  //   } on FormatException {
  //     setState(() {
  //       this.barcode = "Error";
  //     });
  //   }
  // }
}
