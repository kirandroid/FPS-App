import 'package:auto_route/auto_route.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fps/core/utils/app_config.dart';
import 'package:fps/features/allProducts/domain/entities/product_response.dart';
import 'package:fps/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:fps/features/allProducts/presentation/widgets/productInfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:uuid/uuid.dart';

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
                onTap: () async {
                  await scan();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ProductInfo()));
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

  Future scan() async {
    try {
      final ScanResult barcode = await BarcodeScanner.scan();
      await verifyProduct(hash: barcode.rawContent);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          barcode = 'Camera Permission not granted';
        });
      }
    } on FormatException {
      setState(() {
        barcode = "Error";
      });
    }
  }

  void verifyProduct({String hash}) async {
    //to be removed and added while generating hash
    final bool status = await AppConfig.runTransaction(
        functionName: 'createProductItem', parameter: [hash, hash]);
    print(status);

    AppConfig.callFunction(functionName: 'verifyProduct', param: [hash])
        .then((value) {
      print(value);
      ProductResponse product = ProductResponse.fromMap(value[0]);
      if (product.id != "") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductInfo(
                      status: "REAL",
                      product: product,
                    )));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductInfo(
                      status: "FAKE",
                    )));
      }
    }).catchError(
      (onError) {
        print(onError);
      },
    );
  }
}
