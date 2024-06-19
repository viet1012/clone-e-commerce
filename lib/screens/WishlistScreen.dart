import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Map<String, String>> wishlistItems = [
    {
      'image': 'assets/images/products/img (1).png',
      'name': 'Monitor LG 22”inc 4K 120Fps',
      'price': '1999.99',
    },
    {
      'image': 'assets/images/products/img (2).png',
      'name': 'Keyboard Mechanical RGB',
      'price': '149.99',
    },
    {
      'image': 'assets/images/products/img.png',
      'name': 'Gaming Mouse 8000DPI',
      'price': '79.99',
    },
  ];

  void _removeItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text(
              "You want to remove a favorite item, right?",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('YES'),
                onPressed: () {
                  setState(
                    () {
                      wishlistItems.removeAt(index);
                    },
                  );
                },
              ),
            ]);
      },
    );
  }

  void _addItem(String name, String price) {
    setState(() {
      wishlistItems.add({
        'image': 'assets/images/products/img.png',
        'name': name,
        'price': price,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wishlist',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: const [
          // IconButton(
          //   icon: const Icon(Icons.add),
          //   onPressed: () {
          //     _displayAddItemDialog(context);
          //   },
          // ),
        ],
      ),
      body: ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              tileColor: Colors.white,
              shape: Border.all(
                color: Color(0XFFF67C4A7),
              ),
              leading: Image.asset(
                wishlistItems[index]['image']!,
                fit: BoxFit.cover,
              ),
              title: Text(
                wishlistItems[index]['name']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '\$${wishlistItems[index]['price']}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeItem(index),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _displayAddItemDialog(BuildContext context) async {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _priceController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a new item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: "Enter item name"),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(hintText: "Enter item price"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('ADD'),
              onPressed: () {
                _addItem(_nameController.text, _priceController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
