import 'package:auth_feature_1_0/features/layout_feature/Domain/entitity/product_entity.dart';
import 'package:auth_feature_1_0/features/layout_feature/Domain/usecases/Products_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.productsUsecase}) : super(ProductsInitial());

  final ProductsUsecase productsUsecase;
  Future<void> fetchProducts(String url) async {
    emit(ProductsLoading());
    try {
      final products = await productsUsecase.getProductsCall(url);
      emit(ProductsLoaded(products: products));
    } catch (e) {
      emit(ProductsLoadedError(message: e.toString()));
    }
  }
}
