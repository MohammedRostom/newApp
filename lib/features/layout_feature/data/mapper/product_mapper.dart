import 'package:auth_feature_1_0/features/layout_feature/Domain/entitity/product_entity.dart';
import 'package:auth_feature_1_0/features/layout_feature/data/model/product_model.dart';

// converter from model to Entity
class ProductMapper {
  static ProductEntity toEntity(ProductModel productModel) {
    return ProductEntity(
      id: productModel.id,
      title: productModel.title,
      price: productModel.price,
      description: productModel.description,
      category: productModel.category,
      image: productModel.image,
      rate: productModel.rate,
      count: productModel.count,
    );
  }
}
