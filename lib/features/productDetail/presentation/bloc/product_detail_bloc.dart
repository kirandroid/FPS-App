import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fps/core/utils/app_config.dart';
import 'package:meta/meta.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  @override
  Stream<ProductDetailState> mapEventToState(
    ProductDetailEvent event,
  ) async* {
    if (event is GetProductDetail) {
      yield ProductDetailLoading();
      await AppConfig.callFunction(functionName: 'null', param: null);
    }
  }

  @override
  ProductDetailState get initialState => ProductDetailInitial();
}
