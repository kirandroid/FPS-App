import 'package:flutter/material.dart';
import 'package:fps/core/app_config.dart';
import 'package:web3dart/web3dart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String productName = '';

  @override
  void initState() {
    getCompanyProduct();
    super.initState();
  }

  void createCompanyProduct({String companyName, String productName}) async {
    await AppConfig.runTransaction(
        functionName: 'createNewProduct',
        parameter: [companyName, productName]);
  }

  void getCompanyProduct() async {
    final DeployedContract contract =
        await AppConfig.contract.then((value) => value);

    final getProducts = contract.function('getProductByCompany');

    await AppConfig()
        .ethClient()
        .call(contract: contract, function: getProducts, params: ["ki"]).then(
      (productList) async {
        setState(() {
          productName = productList.first[0];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(productName)),
    );
  }
}
