import 'package:flutter/cupertino.dart';
import 'package:fps/core/utils/contract_parser.dart';
import 'package:fps/core/utils/creds.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class AppConfig {
  static Future<Credentials> get txnCredential async {
    return await AppConfig().ethClient().credentialsFromPrivateKey(relayWallet);
  }

  Web3Client ethClient() {
    final Client httpClient = Client();

    return Web3Client(apiUrl, httpClient);
  }

  static Future<DeployedContract> get contract async {
    final DeployedContract contract =
        await ContractParser.fromAssets(contractAddress);
    return contract;
  }

  static Future<List> callFunction(
      {@required String functionName, @required List param}) async {
    final DeployedContract contract = await AppConfig.contract;

    final function = contract.function(functionName);

    try {
      final List returnList = await AppConfig()
          .ethClient()
          .call(contract: contract, function: function, params: param);
      return returnList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<bool> runTransaction(
      {String functionName, List parameter}) async {
    final DeployedContract deployedContract =
        await ContractParser.fromAssets(contractAddress);
    final Credentials credentials =
        await AppConfig().ethClient().credentialsFromPrivateKey(relayWallet);

    final function = deployedContract.function(functionName);
    try {
      await AppConfig()
          .ethClient()
          .sendTransaction(
              credentials,
              Transaction.callContract(
                  maxGas: 1000000,
                  contract: deployedContract,
                  function: function,
                  parameters: parameter),
              fetchChainIdFromNetworkId: true)
          .then(
            (value) => print(value),
          )
          .catchError(
        (onError) {
          throw onError;
        },
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // static Future<EthereumAddress> publicKeyFromSeed({String seedPhrase}) async {
  //   final ConfigurationService configurationService = ConfigurationService();
  //   final AddressService addressService = AddressService(configurationService);
  //   final String privateKey = addressService.getPrivateKey(seedPhrase);
  //   final EthereumAddress publicKey =
  //       await addressService.getPublicAddress(privateKey);

  //   return publicKey;
  // }

  // static Future<EthereumAddress> publicKeyFromPrivate(
  //     {String privateKey}) async {
  //   final ConfigurationService configurationService = ConfigurationService();
  //   final AddressService addressService = AddressService(configurationService);
  //   final EthereumAddress publicKey =
  //       await addressService.getPublicAddress(privateKey);

  //   return publicKey;
  // }

}
