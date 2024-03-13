import 'dart:convert';

import 'package:amazonclone/products.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> imagePaths = [
    'assets/b1.jpg',
    'assets/b2.jpg',
    'assets/b3.jpg',
    'assets/b4.jpg',
    'assets/b5.jpg',
  ];

  
  late TextEditingController _searchController;
  List<dynamic> items = [];
  List<dynamic> filteredItems = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    _searchController = TextEditingController();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (mounted) {
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          items = data;
          filteredItems = data;
        });
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  Future<void> categorydata(categories) async {
    final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/$categories'));

    if (mounted) {
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          items = data;
        });
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  void searchItems(String query) {
    if (query == "") {
      fetchData();
    } else {
      setState(() {
        items = items
            .where((item) =>
                item["title"].toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; // set the mediaquery size

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
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
                    // controller: _searchController,
                    // onChanged: (value) => categorydata1(),
                    controller: _searchController,
                    onChanged: searchItems,
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
              )),
          body: Center(
            child: items.isEmpty
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.white,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () => fetchData(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/all.jpg',
                                          ),
                                          const Text(
                                            "All",
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () => categorydata("electronics"),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/electronics.webp'),
                                          const Text(
                                            "Electronics",
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () => categorydata("jewelery"),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/x4.webp'),
                                          const Text(
                                            "Jewelery",
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          categorydata("men's clothing"),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Image.asset(
                                              'assets/men.jpg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          const Text(
                                            "Men",
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          categorydata("women's clothing"),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/female.jpg',
                                            ),
                                            const Text(
                                              "Women",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height / 4,
                              child: Column(
                                children: [
                                  CarouselSlider(
                                    items: imagePaths.map((String imagePath) {
                                      return Image.asset(
                                        imagePath,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        fit: BoxFit.cover,
                                      );
                                    }).toList(),
                                    options: CarouselOptions(
                                        autoPlay: true,
                                        autoPlayInterval:
                                            const Duration(milliseconds: 4000),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        enlargeCenterPage: true,
                                        clipBehavior: Clip.hardEdge),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Container(
                              color: Colors.grey.shade200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFFF9900),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: const Icon(
                                                    Icons.touch_app,
                                                    color: Colors.black,
                                                    size: 25.0,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      " WIDE",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      " SELECTION",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFFF9900),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: const Icon(
                                                    Icons
                                                        .currency_rupee_outlined,
                                                    color: Colors.black,
                                                    size: 25.0,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      " PAY ON",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      " DELIVERY",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFFF9900),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: const Icon(
                                                    Icons
                                                        .keyboard_return_outlined,
                                                    color: Colors.black,
                                                    size: 25.0,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      " EASY",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      " RETURNS",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "More Products",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  GridView.count(
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children:
                                        List.generate(items.length, (index) {
                                      var data = items[index];
                                      return Container(
                                        constraints: const BoxConstraints(
                                            maxHeight: 300.0),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.001,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                          ),
                                          child: Card(
                                            elevation: 6.0,
                                            color: Colors.grey.shade50,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0)),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Products(
                                                                  id: data[
                                                                      "id"]),
                                                        ),
                                                      );
                                                    },
                                                    child: Image.network(
                                                      data["image"],
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              6,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              6,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 5.0),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            data["title"],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.020,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 2),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .currency_rupee,
                                                                size: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.020,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              Text(
                                                                data["price"]
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.025,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.01,
                                                              ),
                                                              Text(
                                                                "-50%",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.025,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
      
        ));
  }
}
