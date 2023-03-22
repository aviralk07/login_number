import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isAligned = false;

  void _toggleAlignment() {
    setState(() {
      _isAligned = !_isAligned;
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the _toggleAlignment method every 2 seconds
    Timer.periodic(Duration(seconds: 2), (_) => _toggleAlignment());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: Duration(seconds: 1),
      alignment: _isAligned ? Alignment.center : Alignment.topLeft,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    );
  }
}
