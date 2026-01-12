import 'package:auth_feature_1_0/features/layout_feature/Domain/entitity/product_entity.dart';

abstract class ProductsReboAbs {
  Future<List<ProductEntity?>> getProducts(String Url);
}
