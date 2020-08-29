// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'features/addProduct/presentation/bloc/add_product_bloc.dart';
import 'features/allProducts/presentation/bloc/all_product_bloc.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<AddProductBloc>(() => AddProductBloc());
  gh.factory<AllProductBloc>(() => AllProductBloc());
  gh.factory<AuthBloc>(() => AuthBloc());
  return get;
}
