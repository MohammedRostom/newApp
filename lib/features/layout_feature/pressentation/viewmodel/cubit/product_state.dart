part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductsInitial extends ProductState {}

final class ProductsLoading extends ProductState {}

final class ProductsLoaded extends ProductState {
  final List<ProductEntity?> products;

  ProductsLoaded({required this.products});
}

final class ProductsLoadedError extends ProductState {
  final String message;

  ProductsLoadedError({required this.message});
}
