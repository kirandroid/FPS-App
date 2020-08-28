import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
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
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Icon(
                          Icons.chevron_left,
                          size: 30,
                          color: Colors.white,
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
                      SizedBox()
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Product Number",
                      labelStyle: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Product Name",
                      labelStyle: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Manufacture Date",
                      labelStyle: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Expiry Date",
                      labelStyle: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Manufactured At",
                      labelStyle: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Manufacturer Name",
                      labelStyle: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Product Price",
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
                    onTap: () {},
                    child: Container(
                      height: 41,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffEC686F)),
                      child: Center(
                          child: Text(
                        'Add Product',
                        style: GoogleFonts.poppins(
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
          ],
        ),
      ),
    );
  }
}
