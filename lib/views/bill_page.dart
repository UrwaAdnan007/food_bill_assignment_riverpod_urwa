import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_bill_assignment_riverpod_urwa/controller/bill_controller.dart';
// import 'package:food_bill_assignment_riverpod_urwa/controller/bill_controller.dart';

class BillPage extends ConsumerWidget {
  const BillPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProductProvider);
    final total = cartItems.fold<double>(0.0,
        (sum, products) => sum + double.parse(products.price) * products.qty);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Total Bill',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const  Padding(
            padding: EdgeInsets.all(8.0),
            child:SizedBox(
              height: 150,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Item Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Text(
                    'Quantity.',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Text(
                    'Price',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Text(
                    'Total',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Consumer(
              builder: (context, ref, child) {
                final cartItems = ref.watch(cartProductProvider);

                return cartItems.isNotEmpty
                    ? ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 400,
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               const SizedBox(
                                  width: 60,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      (cartItems[index].name),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ],
                                ),
                              const SizedBox(
                                  width: 100,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      (cartItems[index].qty.toString()),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  (cartItems[index].price),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  ('Rs.${double.parse(cartItems[index].price) * cartItems[index].qty}'),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                const Spacer(),
                              ],
                            ),
                          );
                        })
                    : const Center(child: Text('No Order'));
              },
            ),

          ),
          Text(
            ('TOTAL AMOUNT: Rs.$total'),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
