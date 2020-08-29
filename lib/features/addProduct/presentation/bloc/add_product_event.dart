part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class AddProduct extends AddProductEvent {
  final String productName;
  final String productDescription;
  final BuildContext context;

  AddProduct(
      {@required this.productName,
      @required this.productDescription,
      @required this.context});
}
