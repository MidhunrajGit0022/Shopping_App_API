import 'package:flutter/material.dart';

class you extends StatefulWidget {
  const you({super.key});

  @override
  State<you> createState() => _youState();
}

class _youState extends State<you> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
              width: screenSize.width * 0.2,
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
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
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  Container(
                    height: screenSize.longestSide * 0.06,
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: ClipOval(
                              clipBehavior: Clip.antiAlias,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.grey,
                                child: const Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hello,",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "EN",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                      color: Color.fromARGB(19, 0, 0, 0)),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(190, 50)),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.grey.shade200),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Your Orders",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(188, 0, 0, 0)),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                      color: Color.fromARGB(19, 0, 0, 0)),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(190, 50)),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.grey.shade200),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Buy Again",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(188, 0, 0, 0)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                      color: Color.fromARGB(19, 0, 0, 0)),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(190, 50)),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.grey.shade200),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Your Account",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(188, 0, 0, 0)),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                      color: Color.fromARGB(19, 0, 0, 0)),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(190, 50)),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.grey.shade200),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Your Lists",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(188, 0, 0, 0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your Orders",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Hi! Your Orders.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      SizedBox(
                        width: screenSize.width,
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        color: Color.fromARGB(19, 0, 0, 0)),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(390, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.grey.shade200),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Return to the Homepage",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(188, 0, 0, 0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                        thickness: 6,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your Accounts",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics()),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(
                                          color: Color.fromARGB(19, 0, 0, 0)),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(100, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade200),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Your Addresses",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(188, 0, 0, 0)),
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(
                                          color: Color.fromARGB(19, 0, 0, 0)),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(100, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade200),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Your Orders",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(188, 0, 0, 0)),
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(
                                          color: Color.fromARGB(19, 0, 0, 0)),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(100, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade200),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Top-up your Amazon Pay Wallet",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(188, 0, 0, 0)),
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(
                                          color: Color.fromARGB(19, 0, 0, 0)),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(100, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade200),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "View Amazon Pay balance statement",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(188, 0, 0, 0)),
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(
                                          color: Color.fromARGB(19, 0, 0, 0)),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(100, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade200),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Amazon Pay UPI",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(188, 0, 0, 0)),
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(
                                          color: Color.fromARGB(19, 0, 0, 0)),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(100, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade200),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Manage Your Profiles",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(188, 0, 0, 0)),
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                        thickness: 6,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your Lists",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      SizedBox(
                        width: screenSize.width * 1.0,
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        color: Color.fromARGB(19, 0, 0, 0)),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(390, 100)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.grey.shade200),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        "Shopping List",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromARGB(188, 0, 0, 0)),
                                      ),
                                      Text(
                                        " Private.Default",
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.notes_outlined,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Buy Again",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      SizedBox(
                        width: screenSize.width,
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        color: Color.fromARGB(19, 0, 0, 0)),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(390, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.grey.shade200),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Visit Buy Again",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(188, 0, 0, 0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                        thickness: 6,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
