import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_number/phone.dart';
import 'package:pinput/pinput.dart';
import 'dart:ui' as ui;

class MyOtp extends StatefulWidget {
  const MyOtp({Key? key}) : super(key: key);

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );


    var code = "";



    return Scaffold(
      backgroundColor: Colors.purple.shade500,
      appBar: AppBar(
        elevation: 0.0,
        title:  Center(
            child: Text(
              ' Phone-OTP!',
              style: TextStyle(

                fontSize: 40,
                foreground: Paint()
                  ..shader = ui.Gradient.linear(
                    const Offset(150, 50),
                    const Offset(100, 100),
                    <Color>[
                      Colors.green,
                      Colors.yellow,
                    ],
                  ),
              ),
            ),),
        backgroundColor: Colors.purple.shade500,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/c.jpeg',
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 20,
              ),
             Text(
                'OTP Page!',
                style: TextStyle(
                  backgroundColor: Colors.black87,
                    fontSize: 40,
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(50, 50),
                        const Offset(150, 20),
                        <Color>[
                          Colors.red,
                          Colors.blue,
                        ],
                      ),
                ),
              ),
               SizedBox(
                height: 20,
              ),
              const Text(
                "We need to register your phone without getting started !",
                style: TextStyle(
                    fontSize: 19,
                    fontStyle: FontStyle.normal,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
               Pinput(
                length: 6,
                showCursor: true,
                 onChanged: (value){
                  code=value;
                 },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    try{
                      PhoneAuthCredential credential =
                      PhoneAuthProvider.credential(
                          verificationId: MyPhone.verify, smsCode: code);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      Navigator.pushNamed(context, "home",arguments: (route) => false);
                    }
                    catch(e){
                         print("Wrong otp");
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Verify phone number",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'phone');
                      },
                      child: const Text(
                        "Edit Phone Number ?",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
