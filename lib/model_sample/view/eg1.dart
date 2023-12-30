import 'package:flutter/material.dart';

import '../model/eg1.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({Key? key}) : super(key: key);

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  List<ProductModel> products = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Product Price'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Product Quantity'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addProduct();
            },
            child: Text('Add Product'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Name: ${products[index].name}'),
                  subtitle:
                      Text('Price: \$${products[index].price.toString()}'),
                  trailing: Text('Quantity: ${products[index].quantity}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addProduct() {
    String name = nameController.text;
    double price = double.parse(priceController.text);
    String quantity = quantityController.text;

    var newProduct = ProductModel(name, price, quantity);

    setState(() {
      products.add(newProduct);
    });

    // Clear text fields after adding the product
    nameController.clear();
    priceController.clear();
    quantityController.clear();
  }
}
