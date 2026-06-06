import 'package:ecommerce_app/screens/dashboard.dart';
import 'package:ecommerce_app/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class searchPage extends StatelessWidget {
  const searchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
              child: Column(
                children: [
                  // Back Button and Title Row
                  Row(
                    children: [
                      // Back Button
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
                        'Menvogue',
                        style: GoogleFonts.cormorant(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // searchPage TextField
                  TextField(
                    decoration: InputDecoration(
                      hintText: "searchPage products...",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Body Content (Scrollable Area)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Your existing content here
                  Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Text('Your Products Section Here'),
                    ),
                  ),
                ],
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
                    MaterialPageRoute(builder: (context) => searchPage()),
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
