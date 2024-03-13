import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class cart extends StatefulWidget {
  final int id;

  const cart({super.key, required this.id});

  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
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
        body: ListView.builder(
          itemCount: itemdata.isNotEmpty ? 1 : 0,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.network(
                                itemdata["image"],
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.56,
                                    child: Text(
                                      itemdata["title"].toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "₹ ${itemdata["price"].toString()}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "In Stock",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  Text(
                                    itemdata['category'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey.shade500),
                                  ),
                                  RatingBar(
                                    initialRating: itemdata["rating"]["rate"],
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
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
