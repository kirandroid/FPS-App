import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fps/features/addProduct/presentation/bloc/add_product_bloc.dart';
import 'package:fps/injection.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductBloc, AddProductState>(
      bloc: getIt<AddProductBloc>(),
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xff335C67),
          body: SafeArea(
            child: ListView(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          SizedBox(width: 32.0),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        "Add",
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
                        "Product",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 8),
                      child: TextFormField(
                        controller: productNameController,
                        decoration: InputDecoration(
                          labelText: "Product Name",
                          labelStyle: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 8),
                      child: TextFormField(
                        controller: descriptionController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: " Description",
                          labelStyle: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16),
                      child: InkWell(
                        onTap: () {
                          getIt<AddProductBloc>().add(AddProduct(
                            productName: productNameController.text,
                            productDescription: descriptionController.text,
                          ));
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.redAccent),
                          child: Center(
                            child: state is AddProductLoading
                                ? const CircularProgressIndicator()
                                : Text(
                                    'Add Product',
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
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
