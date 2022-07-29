// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../second_page.dart';

import 'data_class.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfefcff),
      body: Column(children: [
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(width: double.infinity, height: 5, color: Colors.grey)
            ],
          ),
        ),
        SizedBox(height: 200),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Consumer<DataClass>(builder: (context, dataClass, child) {
                return Text(
                  '${dataClass.x}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              }),
              Spacer(),
              Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              )
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(Icons.add),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF716f72), width: 1)),
                ),
                onTap: () {
                  if (Provider.of<DataClass>(context, listen: false).x < 5) {
                    Provider.of<DataClass>(context, listen: false).incrementX();
                  } else {
                    Get.snackbar("Item", "Can not be more than this",
                        backgroundColor: Colors.black,
                        colorText: Colors.white,
                        titleText: Text(
                          "Item",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        messageText: Text(
                          "Can not be more than this",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ));
                  }
                },
              ),
              Spacer(),
              Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.to(() => SecondPage(),
                                transition: Transition.upToDown,
                                duration: Duration(seconds: 1));
                          },
                          child: Text(
                            "Next Page",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                      Spacer(),
                      Icon(Icons.skip_next, color: Colors.white)
                    ],
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        )
      ]),
    );
  }
}
