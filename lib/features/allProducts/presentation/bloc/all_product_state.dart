part of 'all_product_bloc.dart';

@immutable
abstract class AllProductState {}

class AllProductInitial extends AllProductState {}

class AllProductLoading extends AllProductState {}

class AllProductSuccess extends AllProductState {
  final List<ProductResponse> productResponse;

  AllProductSuccess({@required this.productResponse});
}

class AllProductError extends AllProductState {
  final String message;

  AllProductError({@required this.message});
}
