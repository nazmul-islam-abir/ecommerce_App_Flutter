import 'package:ecommerce_app/screens/flashsale.dart';
import 'package:ecommerce_app/screens/list.dart';
import 'package:ecommerce_app/screens/profile.dart';
import 'package:ecommerce_app/screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class dashScreen extends StatefulWidget {
  const dashScreen({super.key});

  @override
  State<dashScreen> createState() => _dashScreenState();
}

class _dashScreenState extends State<dashScreen> {
  List allProducts = [];
  bool isloading = true;

  List flashProducts = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
    flashProduct();
  }

  Future<void> flashProduct() async {
    try {
      final response = await http.get(
        Uri.parse("https://yqovktbsrmldgqmnagak.supabase.co/rest/v1/flashsale"),
        headers: {
          "apikey":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlxb3ZrdGJzcm1sZGdxbW5hZ2FrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODAwNDQxNDUsImV4cCI6MjA5NTYyMDE0NX0.lioBvYPVjBqy2kCrFtIAKzqxKxiNcAtIdWgvDeDTqTg",
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          isloading = false;
          flashProducts = jsonData;
        });
      } else {
        setState(() {
          isloading = false;
          print("Failed to load products");
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isloading = false;
      });
    }
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://yqovktbsrmldgqmnagak.supabase.co/rest/v1/products'),
        headers: {
          "apikey":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlxb3ZrdGJzcm1sZGdxbW5hZ2FrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODAwNDQxNDUsImV4cCI6MjA5NTYyMDE0NX0.lioBvYPVjBqy2kCrFtIAKzqxKxiNcAtIdWgvDeDTqTg",
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        setState(() {
          allProducts = jsonData;
          isloading = false;
        });
      } else {
        print("Failed to load products");
        setState(() => isloading = false);
      }
    } catch (e) {
      setState(() => isloading = false);
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 222, 244, 249),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu),
                        Text(
                          'Menvogue',
                          style: GoogleFonts.cormorant(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.shopping_bag),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 2,
                          ),
                        ),
                        hintText: "Search.....",
                        filled: true,
                        fillColor: const Color.fromARGB(192, 255, 252, 223),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Flash Sells',
                        style: GoogleFonts.robotoMono(fontSize: 24),
                      ),
                      SizedBox(width: 5),
                      Icon(CupertinoIcons.flame, color: Colors.red),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => flashSale()),
                      );
                    },
                    child: Text(
                      'Shop More..',
                      style: GoogleFonts.robotoMono(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 200,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 244, 249),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: flashProducts.length,
                    itemBuilder: (context, index) {
                      final item = flashProducts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 150,
                          height: 180,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),

                                child: Image.network(
                                  item['image_url']?.toString() ?? '',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey.shade300,
                                      child: const Icon(Icons.error, size: 40),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "-${item['discount'].toString()}%",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                right: 10,
                                bottom: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(78, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        item['name']?.toString() ?? '',
                                        style: GoogleFonts.robotoMono(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        ' tk: ${item['price'].toString()}',
                                        style: GoogleFonts.robotoMono(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Buy Now",
                                            style: GoogleFonts.robotoMono(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(CupertinoIcons.shopping_cart),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.robotoMono(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Add your navigation or action here
                    },
                    child: Row(
                      children: [
                        Text(
                          'See all',
                          style: GoogleFonts.robotoMono(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 110,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'icons/shoes.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Shoes",
                            style: GoogleFonts.robotoMono(fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'icons/wrist-watch.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Watches",
                            style: GoogleFonts.robotoMono(fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'icons/wallet.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Wallet",
                            style: GoogleFonts.robotoMono(fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'icons/brand.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Cloths",
                            style: GoogleFonts.robotoMono(fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'icons/tshirt.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Shirts",
                            style: GoogleFonts.robotoMono(fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'icons/online-shopping.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Bags",
                            style: GoogleFonts.robotoMono(fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'icons/pants.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Pants",
                            style: GoogleFonts.robotoMono(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'All Products',
                    style: GoogleFonts.robotoMono(fontSize: 24),
                  ),
                  SizedBox(width: 5),
                  Icon(CupertinoIcons.shopping_cart, color: Colors.red),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 222, 244, 249),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isloading
                        ? Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 20),
                                Text("Loading products..."),
                              ],
                            ),
                          )
                        : allProducts.isEmpty
                        ? Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10),
                                Text("No products found"),
                              ],
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            itemCount: allProducts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.65,
                                ),
                            itemBuilder: (context, index) {
                              final item = allProducts[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                  top: Radius.circular(15),
                                                ),

                                            child: Image.network(
                                              item['image'].toString(),
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                    return Container(
                                                      color:
                                                          Colors.grey.shade300,
                                                      child: Icon(
                                                        Icons.error,
                                                        size: 40,
                                                      ),
                                                    );
                                                  },
                                            ),
                                          ),
                                          const Positioned(
                                            top: 8,
                                            right: 8,
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.favorite_border,
                                                size: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['name'].toString(),
                                              style: GoogleFonts.robotoMono(
                                                color: const Color.fromARGB(
                                                  255,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                                fontSize: 12,
                                              ),
                                            ),

                                            const SizedBox(height: 4),
                                            Text(
                                              'tk: ${item['price'].toString()}',
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text("Buy Now"),
                                                SizedBox(width: 5),
                                                Icon(
                                                  CupertinoIcons.shopping_cart,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => dashScreen()),
                  );
                },
                child: Icon(CupertinoIcons.home),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => searchPage()),
                  );
                },
                child: Icon(CupertinoIcons.search),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderListScreen()),
                  );
                },
                child: Icon(CupertinoIcons.square_favorites),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                child: Icon(CupertinoIcons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
