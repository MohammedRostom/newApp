import 'package:auth_feature_1_0/features/layout_feature/Domain/entitity/product_entity.dart';
import 'package:auth_feature_1_0/features/layout_feature/Domain/rebo_abs/products_rebo_abs.dart';
import 'package:auth_feature_1_0/features/layout_feature/data/datasource/remote/Products_datasource_abs.dart';

import 'package:auth_feature_1_0/features/layout_feature/data/mapper/product_mapper.dart';

class ProductsReboImpl extends ProductsReboAbs {
  @override
  final ProductsDatasourceAbs productsDatasourceAbs;
  ProductsReboImpl({required this.productsDatasourceAbs});

  Future<List<ProductEntity?>> getProducts(String Url) async {
    final products = await productsDatasourceAbs.getProductsFromDataSource(Url);
    final List<ProductEntity?> ProductsEntity = products
        .map((product) => ProductMapper.toEntity(product!))
        .toList();
    return ProductsEntity;
  }
}
