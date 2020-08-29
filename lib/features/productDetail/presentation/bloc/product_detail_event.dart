part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent {}

class GetProductDetail implements ProductDetailEvent {
  final String productId;

  GetProductDetail({this.productId});
}
