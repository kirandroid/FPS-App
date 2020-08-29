import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fps/core/routes/router.gr.dart';
import 'package:fps/core/utils/app_config.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

@injectable
class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  @override
  Stream<AddProductState> mapEventToState(
    AddProductEvent event,
  ) async* {
    if (event is AddProduct) {
      yield AddProductLoading();
      try {
        String productId = Uuid().v1();
        await AppConfig.runTransaction(
            functionName: 'createNewProduct',
            parameter: [
              productId,
              event.productName,
              "PictureURL",
              event.productDescription,
              FirebaseAuth.instance.currentUser.uid
            ]);
        yield AddProductSuccess();
        ExtendedNavigator.of(event.context).pushAndRemoveUntil(
            Routes.productDetailScreen, (route) => false,
            arguments: ProductDetailScreenArguments(productId: productId));
      } catch (e) {
        yield AddProductError(message: e);
      }
    }
  }

  @override
  AddProductState get initialState => AddProductInitial();
}
