import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fps/core/routes/router.gr.dart';
import 'package:fps/features/allProducts/domain/entities/product_response.dart';
import 'package:fps/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:fps/features/scanProduct/presentation/pages/scan_product_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductInfo extends StatefulWidget {
  final String status;
  final ProductResponse product;

  ProductInfo({Key key, this.status, this.product}) : super(key: key);

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  // String status = "FAKE";
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
                        ExtendedNavigator.of(context)
                            .push(Routes.scanProductScreen);
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
                "Product",
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
                "Info",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            widget.status == 'FAKE'
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset('asset/error.png'),
                        Text(
                          'No Such Products Found',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Color(0xff),
                          ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xfff3872e),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Product Name:",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  widget.product.name,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       "Product Price:",
                            //       style: GoogleFonts.poppins(
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //     SizedBox(width: 10),
                            //     Text(
                            //       "Product Name",
                            //       style: GoogleFonts.poppins(
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Row(
                              children: [
                                Text(
                                  "Product Description:",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.product.description,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'STATUS',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 20),
                  widget.status == "FAKE"
                      ? Text(
                          'FAKE',
                          style: GoogleFonts.poppins(
                            color: Color(0xffEC686F),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          'REAL',
                          style: GoogleFonts.poppins(
                            color: Color(0xff2A9D8F),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: InkWell(
                // onTap: scan,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not genuine?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '  Report Product',
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
    );
  }
}
