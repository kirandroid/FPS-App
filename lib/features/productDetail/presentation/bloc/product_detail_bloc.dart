import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fps/core/utils/app_config.dart';
import 'package:fps/features/allProducts/domain/entities/product_response.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

@injectable
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  @override
  Stream<ProductDetailState> mapEventToState(
    ProductDetailEvent event,
  ) async* {
    if (event is GetProductDetail) {
      yield ProductDetailLoading();
      List response = await AppConfig.callFunction(
          functionName: 'verifyProduct', param: [event.productId]);

      ProductResponse product = ProductResponse.fromMap(response[0]);

      yield ProductDetailSuccess(response: product);
    }
  }

  @override
  ProductDetailState get initialState => ProductDetailInitial();
}
