import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final List products;
  final int index;
  const ProductCard({
    super.key,
    required this.products,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                products[index]['title'].toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${products[index]['price'].toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Image.asset(products[index]["imageUrl"].toString(),
                  height: 200, alignment: Alignment.topRight),
            ],
          ),
        ),
      ),
    );
  }
}
