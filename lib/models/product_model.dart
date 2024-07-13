// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String img;
  String price;
  String name;
  int qty;
  final int pid;
  Product({
    required this.img,
    required this.price,
    required this.name,
    this.qty = 0,
    required this.pid,
  });

  Product copyWith({
    String? img,
    String? price,
    String? name,
    int? qty,
    bool? isSelected,
    int? pid,
  }) {
    return Product(
      img: img ?? this.img,
      price: price ?? this.price,
      name: name ?? this.name,
      qty: qty ?? this.qty,
      pid: pid ?? this.pid,
    );
  }

  @override
  String toString() {
    return 'Product(img: $img, price: $price, name: $name, qty: $qty, pid: $pid)';
  }
}
