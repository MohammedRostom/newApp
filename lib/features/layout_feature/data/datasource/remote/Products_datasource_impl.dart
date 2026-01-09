import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/services/api_services/abi_services.dart';
import 'package:auth_feature_1_0/features/layout_feature/data/datasource/remote/Products_datasource_abs.dart';
import 'package:auth_feature_1_0/features/layout_feature/data/model/product_model.dart';

class ProductsDatasourceImpl extends ProductsDatasourceAbs {
  final ApiServices apiServices;

  ProductsDatasourceImpl({required this.apiServices});
  @override
  Future<List<ProductModel?>> getProductsFromDataSource(String Url) async {
    final List<dynamic> Products = await apiServices.get(url: Url);
    return Products.map((json) => ProductModel.fromJson(json)).toList();
  }
}
