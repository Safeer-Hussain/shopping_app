import 'package:flutter/material.dart';
import 'package:shopping_app/product_card.dart';

import '../global_variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filters = const ["All", "Adidas", "Nike", "Bata"];
  late String selectedFilters;
  @override
  void initState() {
    super.initState();
    selectedFilters = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Shoes\nCollection",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            )
          ]),
          SizedBox(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        selectedFilters = filters[index];
                        setState(() {});
                      },
                      child: Chip(
                        side: const BorderSide(
                            color: Color.fromRGBO(245, 247, 249, 1)),
                        labelStyle: const TextStyle(fontSize: 16),
                        backgroundColor: selectedFilters == filters[index]
                            ? Theme.of(context).primaryColor
                            : const Color.fromRGBO(245, 247, 249, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        label: Text(filters[index]),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(products: products, index: index);
                }),
          )
        ]),
      ),
    );
  }
}
