import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Color.fromARGB(255, 255, 115, 0),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> productImages = [
    'https://example.com/product1.jpg',
    'https://example.com/product2.jpg',
    'https://example.com/product3.jpg',
    'https://example.com/product4.jpg', // Added product
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Godrej'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _handleSearchButtonPress,
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: _handleProfileButtonPress,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: _handleSwipe,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(productImages[currentIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Product Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$100',
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 172, 201, 173),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addToCart,
              child: Text('Tambahkan ke keranjang'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSwipe(DragEndDetails details) {
    if (details.primaryVelocity! > 0) {
      // Swipe to the right
      setState(() {
        currentIndex = (currentIndex - 1 + productImages.length) %
            productImages.length;
      });
    } else if (details.primaryVelocity! < 0) {
      // Swipe to the left
      setState(() {
        currentIndex = (currentIndex + 1) % productImages.length;
      });
    }
  }

  void _handleSearchButtonPress() {
    // Handle search button press
  }

  void _handleProfileButtonPress() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seller Profile'),
          content: Column(
            children: [
              Text('Seller Name: John Doe'),
              Text('Rating: 4.5'),
              // Add more seller details as needed
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _addToCart() {
    // Add to Cart logic
  }
}