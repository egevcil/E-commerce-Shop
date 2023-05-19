import 'package:flutter/material.dart';

//Alışveriş sepeti

class CartScreen extends StatelessWidget {
  final List<String> items;

  CartScreen({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: items.isEmpty
          ? const Center(
        child: Text('The cart is empty'),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index]),
            trailing: Text('\$${(index + 1) * 10}'),
          );
        },
      ),
    );
  }
}



