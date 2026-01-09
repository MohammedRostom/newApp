import 'package:auth_feature_1_0/features/layout_feature/data/model/product_model.dart';

abstract class ProductsDatasourceAbs {
  Future<List<ProductModel?>> getProductsFromDataSource(String Url);
}
