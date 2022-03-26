import 'package:flutter/material.dart';
import 'package:my_app/models/product.dart';

class ProductAdd extends StatefulWidget {
  List<Product> products;
  ProductAdd(this.products);
  @override
  State<StatefulWidget> createState() {
    return _ProductAddState();
  }
}

class _ProductAddState extends State<ProductAdd> {
  Product product = Product(name: "", status: true, image: "");
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("form"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            buildName(),
            buildStatus(),
            buildImage(),
            buildButton()
          ]),
        ),
      ),
    );
  }

  Widget buildName() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "Ürün Adı", hintText: "Macbook pro"),
      onSaved: (value) {
        product.name = value;
      },
    );
  }

  buildStatus() {
    return DropdownButton<bool>(
        hint: Text("Ürün Durumu"),
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down),
        items: <bool>[true, false].map<DropdownMenuItem<bool>>((bool value) {
          return DropdownMenuItem<bool>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
        onChanged: (bool? value) {
          product.status = value;
        });
  }

  buildImage() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Ürün Resmi", hintText: "Macbook pro"),
        onSaved: (value) {
        product.image = value;
      },
    );
  }

  buildButton() {
    return TextButton(
        onPressed: () {
          widget.products.add(product);
          Navigator.pop(context);
        },
        child: Text("Ekle"));
  }
}
