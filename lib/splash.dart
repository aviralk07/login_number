import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_number/phone.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    _navigatetohome();
    Timer.periodic(Duration(seconds:2), (_) => _toggleAlignment());
  }

  bool selected1 = false;
  bool isVisible = true;
  void _toggleAlignment() {
    setState(() {
      selected1 = !selected1;
    });
  }
  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 10),(){});
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyPhone() ));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  // selected1 = !selected1;
                });
              },
child:  AnimatedAlign(
      alignment: selected1 ? Alignment.bottomLeft : Alignment.bottomRight,
      duration: Duration(seconds: 2),
      // curve: Curves.fastLinearToSlowEaseIn,
      // child: Container(height: 150,width: 200,color: Colors.white,
        child: Image.asset(
          "assets/phone.png",
          height: 200,
          width: 200,
        ),
      ),
),
SizedBox(height:10),
            Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'Phone Login Page!',
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.black87!,
                  ),
                ),
                // Solid text as fill.
                Text(
                  'Phone Login Page!',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey[50],
                  ),
                ),
              ],
            ),


            //
            // ),


        ],
        ),
      ),
    );
  }
}
