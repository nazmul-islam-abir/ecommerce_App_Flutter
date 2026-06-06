import 'package:ecommerce_app/screens/dashboard.dart';
import 'package:ecommerce_app/screens/list.dart';
import 'package:ecommerce_app/screens/profile.dart';
import 'package:ecommerce_app/screens/search.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class flashSale extends StatefulWidget {
  const flashSale({super.key});

  @override
  State<flashSale> createState() => _flashSaleState();
}

class _flashSaleState extends State<flashSale> {
  List flashProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
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
          isLoading = false;
          flashProducts = jsonData;
        });
      } else {
        setState(() {
          isLoading = false;
          print("Failed to load products");
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 244, 249),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => dashScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.arrow_back, size: 24),
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Title
                      Text(
                        'Flash Sales',
                        style: GoogleFonts.cormorant(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: isLoading
                    ? Text("Loading Products")
                    : flashProducts.isEmpty
                    ? Text("No Products")
                    : GridView.builder(
                        itemCount: flashProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              childAspectRatio: .6,
                            ),
                        itemBuilder: (context, index) {
                          final item = flashProducts[index];
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          item['image_url'].toString(),
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Container(
                                                  color: Colors.grey.shade300,
                                                  child: Icon(
                                                    Icons.error,
                                                    size: 40,
                                                  ),
                                                );
                                              },
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: Container(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Text(
                                                "-${item['discount'].toString()}%",
                                                style: GoogleFonts.robotoMono(
                                                  color: Colors.redAccent,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
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
                                        Text(item['name'].toString()),
                                        const SizedBox(height: 4),
                                        Text('tk: ${item['price'].toString()}'),
                                        Row(
                                          children: [
                                            Text("Buy Now"),
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
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
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
