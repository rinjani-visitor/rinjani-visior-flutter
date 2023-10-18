import 'package:rinjani_visitor/features/product/domain/product_model.dart';

abstract class ProductUsecase {
  Future<List<ProductModel>> emit();
}
