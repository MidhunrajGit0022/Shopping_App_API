import 'dart:convert';
import 'dart:developer';

import 'package:amazonclone/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class Products extends StatefulWidget {
  final int id;
  final List<dynamic> cartitem;

  const Products({
    Key? key,
    required this.id,
    required this.cartitem,
  }) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int _currentIndex = 0;

  final Map<String, Widget> _pages = {
    // 'Home': const Products(),
    'You': const PlaceholderWidget('You'),
    'More': const PlaceholderWidget('More'),
    'Cart': const PlaceholderWidget('Cart'),
    'Menu': const PlaceholderWidget('Menu'),
  };

  List<dynamic> items = [];

// int id = required.this.id;

  Map<String, dynamic> itemdata = {};

  @override
  void initState() {
    super.initState();
    fetchData(widget.id);
  }

  Future<void> fetchData(int id) async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));

    if (mounted) {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          itemdata = data;
        });
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  void addtocart() {
    if (itemdata.isNotEmpty) {
      setState(() {
        widget.cartitem.add(itemdata);
      });

      for (var item in widget.cartitem) {
        log(item.toString());
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => cart(arraydata: widget.cartitem),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            iconSize: 28,
          ),
          toolbarHeight: screenSize.height * 0.1,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade300,
                  Colors.cyan,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SizedBox(
              width: screenSize.width * 1.0,
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 255, 255, 1),
                  labelText: 'Search Amazon.in',
                  labelStyle: const TextStyle(color: Colors.grey),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 31, 31, 31),
                    size: 30,
                  ),
                  suffixIcon: Builder(
                    builder: (BuildContext context) {
                      final double iconSize =
                          MediaQuery.of(context).size.width * 0.06;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.center_focus_strong_outlined,
                                size: iconSize),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.mic_none_outlined, size: iconSize),
                          ],
                        ),
                      );
                    },
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: itemdata.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  child: Container(
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, left: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red.shade600,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "85%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "off",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    child: const Icon(
                                      Icons.share_outlined,
                                      size: 32,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Image.network(
                              // 'assets/deals.jpg',
                              itemdata["image"],
                              height: MediaQuery.of(context).size.height / 2,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    child: const Icon(
                                      Icons.favorite_border_outlined,
                                      size: 32,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        itemdata["rating"]["rate"].toString(),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.030,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade700),
                                      ),
                                      RatingBar(
                                        initialRating: itemdata["rating"]
                                            ["rate"],
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 15,
                                        ignoreGestures: true,
                                        ratingWidget: RatingWidget(
                                          full: const Icon(Icons.star,
                                              color: Colors.orange),
                                          half: const Icon(Icons.star_half,
                                              color: Colors.orange),
                                          empty: const Icon(Icons.star_outline,
                                              color: Colors.orange),
                                        ),
                                        onRatingUpdate: (value) {},
                                      ),
                                      Text(
                                        itemdata["category"],
                                        style: TextStyle(
                                            color: Colors.grey.shade700),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "IQOO z7 pro",
                                        itemdata["title"].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.050,
                                            color: Colors.grey.shade800),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.010,
                                      ),
                                      Text(
                                        itemdata["description"].toString(),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.030,
                                            color: Colors.grey.shade600),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.030,
                                        thickness: 1,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.currency_rupee,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.050,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                itemdata["price"].toString(),
                                                style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.050,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.01,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.030,
                                        thickness: 1,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Container(
                                        color: Colors.white,
                                        constraints: const BoxConstraints(
                                          maxWidth: 400.0,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                addtocart();
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.amber),
                                                shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 15,
                                                  horizontal: 120,
                                                ),
                                                child: Text(
                                                  "Add to Cart",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.050,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.015,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.orange),
                                                shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 15,
                                                  horizontal: 130,
                                                ),
                                                child: Text(
                                                  "Buy Now",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.050,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.050,
                                              thickness: 1,
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Container(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.grey
                                                                      .shade200,
                                                              radius: 25,
                                                              child: Image.asset(
                                                                  'assets/service.png'),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.15,
                                                              color:
                                                                  Colors.white,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "7 days Service Centre Replacement",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                0.020,
                                                                        color: Colors
                                                                            .blue),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.050,
                                                        ),
                                                        Column(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.grey
                                                                      .shade200,
                                                              radius: 25,
                                                              child: Image.asset(
                                                                  'assets/free.png'),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                              color:
                                                                  Colors.white,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    " Free Delivery ",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                0.020,
                                                                        color: Colors
                                                                            .blue),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.050,
                                                        ),
                                                        Column(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.grey
                                                                      .shade200,
                                                              radius: 25,
                                                              child: Image.asset(
                                                                  'assets/warranty.png'),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.15,
                                                              color:
                                                                  Colors.white,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "1 Year Warranty",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                0.020,
                                                                        color: Colors
                                                                            .blue),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.050,
                                                        ),
                                                        Column(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.grey
                                                                      .shade200,
                                                              radius: 25,
                                                              child: Image.asset(
                                                                  'assets/payment.png'),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.15,
                                                              color:
                                                                  Colors.white,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "Pay on Delivery",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                0.020,
                                                                        color: Colors
                                                                            .blue),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.050,
                                                        ),
                                                        Column(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.grey
                                                                      .shade200,
                                                              radius: 25,
                                                              child: Image.asset(
                                                                  'assets/brand.png'),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.15,
                                                              color:
                                                                  Colors.white,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "Top Brand",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                0.020,
                                                                        color: Colors
                                                                            .blue),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.050,
                                                        ),
                                                        Column(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.grey
                                                                      .shade200,
                                                              radius: 25,
                                                              child: Image.asset(
                                                                  'assets/delivery.png'),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.15,
                                                              color:
                                                                  Colors.white,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "Amazon Delivered",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                0.020,
                                                                        color: Colors
                                                                            .blue),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.050,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.050,
                                              thickness: 1,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
        bottomSheet: _pages[_currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.black),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: Colors.black,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedLabelStyle: const TextStyle(color: Colors.black),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.black),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, color: Colors.black),
                label: 'You',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_sharp, color: Colors.black),
                label: 'More',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_outlined,
                    color: Colors.black),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined, color: Colors.black),
                label: 'Menu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;

  const PlaceholderWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
