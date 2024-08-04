import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
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
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: SizedBox(
                        width: screenSize.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 15, right: 15),
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(255, 255, 255, 1),
                              labelText: 'Search Amazon.in',
                              labelStyle: const TextStyle(color: Colors.grey),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
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
                                        Icon(Icons.mic_none_outlined,
                                            size: iconSize),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 35,
                      ),
                      child: Icon(
                        Icons.qr_code_scanner_outlined,
                        size: 30,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  
                  child: SizedBox(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                                Menuitem(screenSize: screenSize),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}

class Menuitem extends StatelessWidget {
  const Menuitem({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Amazon Pay",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Container(
            height: screenSize.height * 0.08,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Colors.cyan.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            // child: SizedBox(
            //   width: 10,
            //   child: Image.asset(
            //     'assets/logo.png',
            //     fit: BoxFit.contain,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
