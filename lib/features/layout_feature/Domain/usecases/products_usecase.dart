import 'package:auth_feature_1_0/features/layout_feature/Domain/entitity/product_entity.dart';
import 'package:auth_feature_1_0/features/layout_feature/Domain/rebo_abs/products_rebo_abs.dart';

class ProductsUsecase {
  final ProductsReboAbs productsReboAbs;

  ProductsUsecase({required this.productsReboAbs});

  Future<List<ProductEntity?>> getProductsCall(String Url) async {
    return await productsReboAbs.getProducts(Url);
  }
}
