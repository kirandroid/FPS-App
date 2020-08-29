import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fps/core/utils/app_config.dart';
import 'package:fps/features/allProducts/domain/entities/product_response.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'all_product_event.dart';
part 'all_product_state.dart';

@injectable
class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  @override
  Stream<AllProductState> mapEventToState(
    AllProductEvent event,
  ) async* {
    if (event is GetAllProduct) {
      yield AllProductLoading();
      try {
        final String userId = FirebaseAuth.instance.currentUser.uid;
        final List rawProductList = await AppConfig.callFunction(
            functionName: 'getProductByCompany', param: [userId]);
        final List<ProductResponse> productList = [];

        for (var i = 0;
            i < int.parse(rawProductList.first.length.toString());
            i++) {
          ProductResponse productResponse =
              ProductResponse.fromMap(rawProductList.first[i]);
          productList.add(productResponse);
        }
        yield AllProductSuccess(productResponse: productList);
      } catch (e) {
        yield AllProductError(message: e);
      }
    }
  }

  @override
  AllProductState get initialState => AllProductInitial();
}
