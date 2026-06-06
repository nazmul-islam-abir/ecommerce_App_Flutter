import 'package:ecommerce_app/screens/dashboard.dart';
import 'package:ecommerce_app/screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                        'Menvogue',
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

          // Body Content (Scrollable Area)
          Column(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,

                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 185, 94),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Icon(Icons.edit)],
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            fit: BoxFit.cover,
                            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1064&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Md Nazmul Islam Abir',
                        style: GoogleFonts.robotoMono(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("naz@gmail.com"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),

          Expanded(
            child: Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 222, 244, 249),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 48, right: 18, top: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Orders",
                          style: GoogleFonts.robotoMono(fontSize: 20),
                        ),
                        Icon(Icons.arrow_right),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Favourites",
                          style: GoogleFonts.robotoMono(fontSize: 20),
                        ),
                        Icon(Icons.favorite),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping Address",
                          style: GoogleFonts.robotoMono(fontSize: 20),
                        ),
                        Icon(Icons.local_shipping),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Save Cards",
                          style: GoogleFonts.robotoMono(fontSize: 20),
                        ),
                        Icon(Icons.card_giftcard),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Vouchers",
                          style: GoogleFonts.robotoMono(fontSize: 20),
                        ),
                        Icon(Icons.discount),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Log out",
                          style: GoogleFonts.robotoMono(fontSize: 20),
                        ),
                        Icon(Icons.logout),
                      ],
                    ),
                  ],
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
