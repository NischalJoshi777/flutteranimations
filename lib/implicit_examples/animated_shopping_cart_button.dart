import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isAdded = false;

  void updateCartButton() {
    setState(() {
      isAdded = !isAdded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            updateCartButton();
          },
          child: AnimatedContainer(
            curve: Curves.easeIn,
            width: isAdded ? 140.0 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isAdded ? Colors.lightGreen : Colors.blue,
              borderRadius: BorderRadius.circular(isAdded ? 32.0 : 10.0),
            ),
            duration: const Duration(milliseconds: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  isAdded ? Icons.check : Icons.shopping_cart,
                  color: Colors.white,
                ),
                if (isAdded) ...[
                  const Flexible(
                    flex: 2,
                    child: Text(
                      'Added to cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
