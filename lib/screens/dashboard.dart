import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dashScreen extends StatefulWidget {
  const dashScreen({super.key});

  @override
  State<dashScreen> createState() => _dashScreenState();
}

class _dashScreenState extends State<dashScreen> {
  List leftProducts = [
    {
      "name": "Shoes & Watch",
      "price": "5000 tk",
      "image": "pexels-mnzoutfits-1619655.jpg",
    },
    {
      "name": "Oxford Shoes",
      "price": "6000 tk",
      "image": "pexels-rohit-sharma-1230131-26587836.jpg",
    },
    {
      "name": "Wallet",
      "price": "600 tk",
      "image": "pexels-ekrulila-28086454.jpg",
    },
     {
      "name": "Wallet",
      "price": "600 tk",
      "image": "pexels-jonathanborba-12031206.jpg",
    },
    {
      "name": "Wallet",
      "price": "600 tk",
      "image": "pexels-rebornfilmes-31280435.jpg",
    },
    {
      "name": "Wallet",
      "price": "600 tk",
      "image": "pexels-vishnu-v-n-184319568-11263089.jpg",
    },
    
  ];

  List rightProducts = [
    {
      "name": "Formal Suit",
      "price": "10000 tk",
      "image": "pexels-peep-this-photo-1766934996-29379168.jpg",
    },
    {
      "name": "Wallet",
      "price": "600 tk",
      "image": "pexels-jonathanborba-12031206.jpg",
    },
    {
      "name": "Wallet",
      "price": "600 tk",
      "image": "pexels-rebornfilmes-31280435.jpg",
    },
    {
      "name": "Wallet",
      "price": "600 tk",
      "image": "pexels-vishnu-v-n-184319568-11263089.jpg",
    },
    {
      "name": "Black Shoes",
      "price": "4000 tk",
      "image": "pexels-ron-lach-9464625.jpg",
    },
    {
      "name": "Rolex Watch",
      "price": "600000 tk",
      "image": "pexels-sinarz97-26595749.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.height,
            height: MediaQuery.of(context).size.height * 0.2,
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
          SizedBox(height: 5),

          Expanded(
            child: SizedBox(
              child: Container(
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
                      Container(
                        height: 70,

                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  right: 3,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Trending",
                                              style: GoogleFonts.robotoMono(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Icon(CupertinoIcons.flame_fill),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 3,
                                  right: 3,
                                ),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Shoes",
                                          style: GoogleFonts.robotoMono(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Image.asset(
                                          'icons/shoes.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 3,
                                  right: 3,
                                ),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Watches",
                                          style: GoogleFonts.robotoMono(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Image.asset(
                                          'icons/wrist-watch.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 3,
                                  right: 3,
                                ),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Wallet",
                                          style: GoogleFonts.robotoMono(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Image.asset(
                                          'icons/wallet.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 3,
                                  right: 3,
                                ),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Cloths",
                                          style: GoogleFonts.robotoMono(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Image.asset(
                                          'icons/brand.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 3,
                                  right: 3,
                                ),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Shirts",
                                          style: GoogleFonts.robotoMono(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Image.asset(
                                          'icons/tshirt.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 3,
                                  right: 3,
                                ),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Bags",
                                          style: GoogleFonts.robotoMono(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Image.asset(
                                          'icons/online-shopping.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 3,
                                  right: 3,
                                ),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Pants",
                                          style: GoogleFonts.robotoMono(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Image.asset(
                                          'icons/pants.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Row(
                          children: [
                           Expanded(
  child: ListView.builder(
    itemCount: leftProducts.length,
    itemBuilder: (context, index) {
      final item = leftProducts[index];

      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                item['image'],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              item['name'],
              style: GoogleFonts.robotoMono(fontSize: 18),
            ),
            Text(
              item['price'],
              style: GoogleFonts.robotoMono(fontSize: 16),
            ),
          ],
        ),
      );
    },
  ),
),

                            SizedBox(width: 8),

                            Expanded(
  child: ListView.builder(
    itemCount: rightProducts.length,
    itemBuilder: (context, index) {
      final item = rightProducts[index];

      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                item['image'],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              item['name'],
              style: GoogleFonts.robotoMono(fontSize: 18),
            ),
            Text(
              item['price'],
              style: GoogleFonts.robotoMono(fontSize: 16),
            ),
          ],
        ),
      );
    },
  ),
),
                          ],
                        ),
                      ),
                    ],
                  ),
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home, color: Colors.black),
              Icon(Icons.search, color: Colors.black),
              Icon(Icons.favorite_border, color: Colors.black),
              Icon(Icons.person, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
