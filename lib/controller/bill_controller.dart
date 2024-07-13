import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_bill_assignment_riverpod_urwa/data/product_data.dart';
import 'package:food_bill_assignment_riverpod_urwa/models/product_model.dart';

class CartProductNotifier extends StateNotifier<List<Product>> {
  CartProductNotifier() : super([]);

  void addToCart(
    Product productItems,
  ) {
    state = List.from(state);
    if (state.contains(productItems)) {
      productItems.qty++;
      print("Productqtyyyy ${productItems.qty}");
    } else {
      state.add(productItems);
      productItems.qty++;
    }
  }

  void removeFromCart(Product productItems) {
    state = List.from(state);
    if (productItems.qty > 1) {
      productItems.qty--;
      print(productItems.qty);
    }
  }

  void emptyCart() {
    state = [];
  }
}

// Provider for the cart product notifier
final cartProductProvider =
    StateNotifierProvider<CartProductNotifier, List<Product>>((ref) {
  return CartProductNotifier();
});
