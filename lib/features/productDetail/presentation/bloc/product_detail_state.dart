part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailSuccess extends ProductDetailState {
  final ProductResponse response;

  ProductDetailSuccess({this.response});
}

class ProductDetailError extends ProductDetailState {
  final String message;

  ProductDetailError({this.message});
}
