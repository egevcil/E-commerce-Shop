import 'package:flutter/material.dart';
import 'package:shop_application/CartScreen.dart';
import 'package:shop_application/LoginScreen.dart';
import 'package:shop_application/ProfileScreen.dart';
import 'package:shop_application/auth.dart';


class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final Auth _auth = Auth();
  List<String> cartItems = [];

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Electronics',
      'Clothing',
      'Books',
      'Home',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailsScreen(category: categories[index], onAddToCart: (item) {
                    setState(() {
                      cartItems.add(item);
                    });
                  }),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: Center(
                child: Text(categories[index]),
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text('Seçenekler'),
            ),
            ListTile(
              title: const Text('Alışveriş Sepeti'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen(items: cartItems)),
                );
              },
            ),
            ListTile(
              title: const Text('Öğrenci Profilleri'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Alışveriş Kategorileri'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Çıkış Yap'),
              onTap: () {
                _auth.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDetailsScreen extends StatelessWidget {
  final String category;
  final Function(String) onAddToCart;

  ItemDetailsScreen({required this.category, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Text(
                '${index + 1}. Item of ${category}',
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Image.network('https://picsum.photos/id/${index+1}/200/200?random.jpg'),
              const SizedBox(height: 8.0),
              Text('Description of item ${index + 1}'),
              const SizedBox(height: 8.0),
              Text(
                '\$${(index + 1) * 10}',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    onAddToCart('Item ${index + 1}');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item added to cart'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Add to cart'),
                ),
              ),
              const SizedBox(height: 16.0),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}



