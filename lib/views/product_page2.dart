import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_bill_assignment_riverpod_urwa/controller/bill_controller.dart';
import 'package:food_bill_assignment_riverpod_urwa/models/product_model.dart';

// ignore: must_be_immutable
class ProductPage extends ConsumerWidget {
  ProductPage({
    super.key,
    required this.product,
    // required this.productIndex,
  });
  // final int productIndex;
  Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProductProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: height * 0.1,
                width: width,
                child: Image.network(product.img)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Material(
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Material(
                  child: Text(
                    'Rs.${product.price}',
                    style: const TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      if (product.qty > 0) {
                        ref
                            .read(cartProductProvider.notifier)
                            .removeFromCart(product);
                      }
                    },
                    icon: const Icon(
                      Icons.do_not_disturb_on_outlined,
                      size: 30,
                    ),
                  ),
                  Material(
                    child: Text(
                      product.qty.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (product.qty < 8) {
                          ref
                              .read(cartProductProvider.notifier)
                              .addToCart(product);
                        }
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 30,
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
