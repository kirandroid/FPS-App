import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fps/core/routes/router.gr.dart';
import 'package:fps/core/utils/colors.dart';
import 'package:fps/features/allProducts/domain/entities/product_response.dart';
import 'package:fps/features/allProducts/presentation/bloc/all_product_bloc.dart';
import 'package:fps/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:fps/features/scanProduct/presentation/pages/scan_product_screen.dart';
import 'package:fps/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:fps/injection.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProductScreen extends StatefulWidget {
  AllProductScreen({Key key}) : super(key: key);

  @override
  _AllProductScreenState createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  AllProductBloc _allProductBloc = getIt<AllProductBloc>();
  @override
  void initState() {
    _allProductBloc.add(GetAllProduct());
    super.initState();
  }

  @override
  void dispose() {
    _allProductBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff335C67),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    "fps",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 51,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        "All",
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
                        "Products",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 32.0),
                  child: Icon(
                    Icons.short_text,
                    color: Colors.white,
                    size: 50,
                  ),
                )
              ],
            ),

            BlocProvider<AllProductBloc>(
              create: (context) => AllProductBloc(),
              child: BlocBuilder<AllProductBloc, AllProductState>(
                bloc: this._allProductBloc,
                builder: (context, state) {
                  if (state is AllProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AllProductSuccess) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                          itemCount: state.productResponse.length,
                          itemBuilder: (context, index) {
                            ProductResponse productResponse =
                                state.productResponse[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Card(
                                child: InkWell(
                                  onTap: () {
                                    ExtendedNavigator.of(context).push(
                                      Routes.productDetailScreen,
                                      arguments: ProductDetailScreenArguments(
                                          productResponse: productResponse),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(14),
                                    decoration:
                                        BoxDecoration(color: UIColors.white60),
                                    child: Text(productResponse.name),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else if (state is AllProductError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )

            // Padding(
            //   padding: const EdgeInsets.all(32.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Color(0xfff3872e),
            //         borderRadius: BorderRadius.circular(10)),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Row(
            //             children: [
            //               Text(
            //                 "Product Name:",
            //                 style: GoogleFonts.poppins(
            //                   color: Colors.white,
            //                 ),
            //               ),
            //               SizedBox(width: 10),
            //               Text(
            //                 "Product Name",
            //                 style: GoogleFonts.poppins(
            //                   color: Colors.white,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             children: [
            //               Text(
            //                 "Product Price:",
            //                 style: GoogleFonts.poppins(
            //                   color: Colors.white,
            //                 ),
            //               ),
            //               SizedBox(width: 10),
            //               Text(
            //                 "Product Name",
            //                 style: GoogleFonts.poppins(
            //                   color: Colors.white,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             children: [
            //               Text(
            //                 "Product Description:",
            //                 style: GoogleFonts.poppins(
            //                   color: Colors.white,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Text(
            //             "Adidas AG is a German multinational corporation, founded and headquartered in Herzogenaurach, Germany, that designs and manufactures shoes, clothing and accessories.",
            //             style: GoogleFonts.poppins(
            //               color: Colors.white,
            //             ),
            //             textAlign: TextAlign.justify,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
