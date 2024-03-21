import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class cart extends StatefulWidget {
  final List<dynamic> arraydata;

  const cart({Key? key, required this.arraydata}) : super(key: key);

  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  List<Map<String, dynamic>> itemdata = [];
  // List itemdata= widget.arraydata;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // for (String id in widget.arraydata) {

    for (var item in widget.arraydata) {
      itemdata.add(item);
      log(item.toString());
    }
    // final response =
    //     await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));

    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> data = json.decode(response.body);
    //   setState(() {
    //     itemdata.add(data);
    //   });
    // } else {
    //   throw Exception('Failed to load data');
    // }
    // }
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
                  Colors.cyan.shade300,
                  const Color.fromARGB(146, 178, 235, 242),
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
          itemCount: widget.arraydata.length,
          itemBuilder: (BuildContext context, int index) {
            final item = widget.arraydata[index];
            return ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.network(
                                item["image"],
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
                                        0.50,
                                    child: Text(
                                      item["title"].toString(),
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
                                    "₹ ${item["price"].toString()}",
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
                                    item['category'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey.shade500),
                                  ),
                                  RatingBar(
                                    initialRating: item["rating"]["rate"],
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
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.arraydata.removeAt(index);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ))
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
