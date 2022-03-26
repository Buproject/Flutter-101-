import 'package:flutter/material.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/screens/product_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: homeScreen(),
    );
  }
}

class homeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homeScreenState();
  }
}

class _homeScreenState extends State {
  List<Product> products = [
    Product(
        name: "Macbook",
        status: true,
        image:
            "https://productimages.hepsiburada.net/s/49/444-444/10983950319666.jpg/format:webp"),
    Product(
        name: "Ipad",
        status: false,
        image:
            "https://productimages.hepsiburada.net/s/120/444-444/110000069569293.jpg/format:webp"),
    Product(
        name: "watch",
        status: true,
        image:
            "https://productimages.hepsiburada.net/s/140/444-444/110000093110253.jpg/format:webp"),
    Product(
        name: "watch",
        status: false,
        image:
            "https://productimages.hepsiburada.net/s/126/444-444/110000076903466.jpg/format:webp"),
  ];

  Product selectedProduct = Product(
      name: "Imac",
      status: true,
      image:
          "https://productimages.hepsiburada.net/s/56/444-444/11247800877106.jpg/format:webp");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("buproject")),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(products[index].name.toString()),
                    subtitle:
                        Text("stok: " + products[index].status.toString()),
                    leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(products[index].image.toString())),
                    trailing: buildStatusIcon(products[index].status),
                    onTap: () {
                      setState(() {
                        selectedProduct = products[index];
                      });
                    },
                  );
                },
              ),
            ),
            Center(child: Text(selectedProduct.name.toString())),
            SizedBox(
              height: 40,
            ),
            _getButtons(),
            SizedBox(
              height: 40,
            ),
          ],
        ));
  }

  buildStatusIcon(bool? status) {
    if (status == true) {
      return Icon(Icons.add);
    } else {
      return Icon(Icons.lock_clock);
    }
  }

  _getButtons() {
    return Row(
      children: [
        Flexible(
            flex: 1,
            child: TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductAdd(products))).then((value) => {
                    setState((){})
                });
              },
              child: Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 5),
                  Text("Yeni Ekle")
                ],
              ),
            )),
             Flexible(
            flex: 1,
            child: TextButton(
              onPressed: (){
                print("basıldı");
              },
              child: Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 5),
                  Text("Düzenle")
                ],
              ),
            ))
      ],
    );
  }
}
