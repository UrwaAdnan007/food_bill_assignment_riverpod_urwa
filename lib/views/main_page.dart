import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_bill_assignment_riverpod_urwa/controller/bill_controller.dart';
import 'package:food_bill_assignment_riverpod_urwa/controller/counter_controller.dart';
import 'package:food_bill_assignment_riverpod_urwa/views/bill_page.dart';
import 'package:food_bill_assignment_riverpod_urwa/views/product_page2.dart';

class MainPage extends ConsumerWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(proudctNotifierProvider);
    final cartItems = ref.watch(cartProductProvider);
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 15.0, // spacing between rows
              crossAxisSpacing: 15.0, // spacing between columns
            ),
            padding: const EdgeInsets.all(10.0), // padding around the grid
            itemCount: product.length, // total number of items
            itemBuilder: (context, index) => ProductPage(
              product: product[index],
              // productIndex: index,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BillPage(),
                  ),
                );
              },
              child: const Text('Show Total Bill')),
        )
      ],
    );
  }
}
