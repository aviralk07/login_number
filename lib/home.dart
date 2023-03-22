import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 5), vsync: this)
        ..repeat();
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 150, 169, 186),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Welcome To CR7 World",
              style: TextStyle(color: Colors.black87),
            ),
            Image.asset(
              "assets/cr6.jpeg",
              height: 50,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/cr.jpeg",
            height: 500,
            width: 700,
          ),
          Center(
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.blueGrey,
              child: AnimatedAlign(
                alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Image.asset(
                  "assets/football.png",
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Text(
                    "CR7-Siuu",
                    style: TextStyle(fontSize: 25),
                  )),
              AnimatedBuilder(
                animation: _controller,
                child: Image.asset(
                  "assets/aaa.png",
                  height: 80,
                  width: 80,
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi, child: child);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
