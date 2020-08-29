part of 'add_product_bloc.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductSuccess extends AddProductState {}

class AddProductError extends AddProductState {
  final String message;

  AddProductError({this.message});
}
