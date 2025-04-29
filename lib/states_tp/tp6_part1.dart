import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

enum Product {
  Keyboard,
  Screen,
  Controller,
  Pen
}

class ProductInfo {
  final Product name;
  double unitPrice;
  int quantity;

  ProductInfo(this.name, this.unitPrice, this.quantity);

  double get totalPrice => unitPrice * quantity;

  static List<ProductInfo> getProducts() {
    return [
      ProductInfo(Product.Keyboard, 25, 1),
      ProductInfo(Product.Screen, 200.99, 1),
      ProductInfo(Product.Controller, 45.99, 1),
      ProductInfo(Product.Pen, 1.5, 1),
    ];
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(title: "TP6part1",),
    );
  }
}

class AppHomePage extends StatelessWidget {
  final String title;

  const AppHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Cart()
    );
  }
}

double getTotalCartPrice(values) {
  double totalCartPrice = 0;
  for (var totalProductPrice in values) {
    totalCartPrice += totalProductPrice;
  }
  return totalCartPrice;
}

class ProductRow extends StatelessWidget {
  final ProductInfo product;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductRow({
    super.key,
    required this.product,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: Row(
        children: [
          // Product name
          Expanded(
            flex: 1,
            child: Text(
              product.name.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // Unit price
          Expanded(
            flex: 1,
            child: Text(
              '${product.unitPrice.toStringAsFixed(2)} €',
              textAlign: TextAlign.right,
            ),
          ),

          // "+" button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pinkAccent.shade700),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                icon: const Icon(Icons.add),
                color: Colors.pinkAccent.shade700,
                onPressed: onAdd,
              ),
            ),
          ),

          // Quantity
          Text('${product.quantity}'),

          // "-" button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pinkAccent.shade200),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                icon: const Icon(Icons.remove),
                color: Colors.pinkAccent.shade200,
                onPressed: onRemove,
              ),
            ),
          ),

          // Line total
          Expanded(
            flex: 1,
            child: Text(
              '${product.totalPrice.toStringAsFixed(2)} €',
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}


class CartController {
  final List<ProductInfo> _products = ProductInfo.getProducts();

  List<ProductInfo> get products => _products;

  void addQuantity(int index) {
    _products[index].quantity++;
  }

  void removeQuantity(int index) {
    if (_products[index].quantity > 0) {
      _products[index].quantity--;
    }
  }

  double get totalCartPrice {
    return _products.fold(0, (sum, item) => sum + item.totalPrice);
  }
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController controller = CartController();

  void _handleAdd(int index) {
    setState(() => controller.addQuantity(index));
  }

  void _handleRemove(int index) {
    setState(() => controller.removeQuantity(index));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height:400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(45),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              for (int i = 0; i < controller.products.length; i++)
                ProductRow(
                  product: controller.products[i],
                  onAdd: () => _handleAdd(i),
                  onRemove: () => _handleRemove(i),
                ),
              const SizedBox(height: 10),
              Icon(Icons.shopping_cart, size: 50, color: Colors.amber.shade700),
              Text(
                " Total panier : ${controller.totalCartPrice.toStringAsFixed(
                    2)} €",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}