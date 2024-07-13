import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_bill_assignment_riverpod_urwa/data/product_data.dart';
import 'package:food_bill_assignment_riverpod_urwa/models/product_model.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super(productItems);
}

final proudctNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier();
});
