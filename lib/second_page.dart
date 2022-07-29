// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../home_page.dart';

import 'data_class.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfefcff),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.shopping_cart_outlined),
                        Text(
                          "Shopping Cart",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: double.infinity, height: 5, color: Colors.grey)
                  ],
                ),
              ),
              SizedBox(height: 200),
              Flexible(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Consumer<DataClass>(builder: (context, dataClass, child) {
                        return Text(
                          '${dataClass.x}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        );
                      }),
                      const Text(
                        "-- Total",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (context.read<DataClass>().x > 0) {
                          context.read<DataClass>().decrementX();
                        } else {
                          Get.snackbar("Item", "Can not decrease more",
                              backgroundColor: Colors.black,
                              colorText: Colors.white,
                              titleText: Text(
                                "Item",
                                style: TextStyle(
                                    fontSize: 40, color: Colors.white),
                              ),
                              messageText: Text(
                                "Can not reduce more",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ));
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        child: const Icon(Icons.remove),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: const Color(0xFF716f72))),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => HomePage(),
                                transition: Transition.downToUp,
                                duration: Duration(seconds: 1));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.skip_previous,
                                  color: Color(0xFFfefeff)),
                              Text(
                                "Prev Page",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFFfefeff)),
                              ),
                            ],
                          ),
                        ),
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
