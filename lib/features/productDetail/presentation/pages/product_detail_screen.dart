import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fps/core/utils/app_config.dart';
import 'package:fps/core/utils/colors.dart';
import 'package:fps/core/utils/text_style.dart';
import 'package:fps/features/allProducts/domain/entities/product_response.dart';
import 'package:fps/features/productDetail/presentation/bloc/product_detail_bloc.dart';
import 'package:fps/injection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductResponse productResponse;

  const ProductDetailScreen({Key key, @required this.productResponse})
      : super(key: key);
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool generated = false;
  String barHash = '';
  void generateQR() async {
    String hash = Uuid().v1();
    await AppConfig.runTransaction(
        functionName: 'createProductItem',
        parameter: [
          hash,
          widget.productResponse.id,
        ]).then((value) {
      setState(() {
        generated = !generated;
        barHash = hash;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.primaryBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    ExtendedNavigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "fps",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 51,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product ID: ${widget.productResponse.id},",
                    style:
                        StyleText.popMedium.copyWith(color: UIColors.white60),
                  ),
                  Text(
                    "Product Name: ${widget.productResponse.name},",
                    style:
                        StyleText.popMedium.copyWith(color: UIColors.white60),
                  ),
                  Text(
                    "Description: ${widget.productResponse.description},",
                    style:
                        StyleText.popMedium.copyWith(color: UIColors.white60),
                  ),
                  RaisedButton(
                    onPressed: () {
                      generateQR();
                    },
                    child: Text("Generate QR"),
                  ),
                  generated
                      ? QrImage(
                          data: barHash,
                          version: QrVersions.auto,
                          foregroundColor: Colors.white,
                          size: 200,
                          gapless: false,
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
