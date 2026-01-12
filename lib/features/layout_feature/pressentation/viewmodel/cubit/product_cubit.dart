import 'package:auth_feature_1_0/core/Conenction/checKNet.dart';
import 'package:auth_feature_1_0/features/layout_feature/Domain/entitity/product_entity.dart';
import 'package:auth_feature_1_0/features/layout_feature/Domain/usecases/Products_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.productsUsecase, required this.connectionChecker})
    : super(ProductsInitial());

  final ProductsUsecase productsUsecase;
  final CheckConnection connectionChecker;
  Future<void> fetchProducts(String url) async {
    try {
      emit(ProductsLoading());
      final hasInternet = await connectionChecker.CheckInternet();
      if (!hasInternet) {
        emit(CHeckNet(isHasInternet: false));
        return;
      }
      final products = await productsUsecase.getProductsCall(url);
      emit(ProductsLoaded(products: products));
    } catch (e) {
      emit(ProductsLoadedError(message: e.toString()));
    }
  }

  void changeIndexPage(int indexPage) {
    emit(Changeindex(index: indexPage));
  }
}
