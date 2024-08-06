import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'home.dart';

class OTP extends StatefulWidget {
  // final String _mobile;
  // OTP(this._mobile, {super.key});

  final String _mobile;
  final String _verificationId;

  OTP(this._mobile, this._verificationId, {super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  bool _showError = false;
  @override
  Widget build(BuildContext context) {
    const assetImage = AssetImage('assets/images/moon2.png');
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Background.png'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 260,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(left: 40)),
                Text(
                  "OTP sent to \n ${widget._mobile}",
                  style: const TextStyle(
                    color: Color(0xFFCFC6E1),
                    fontSize: 28,
                    fontFamily: "Times New Roman"
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 40)),
                Text(
                  "Enter OTP to login",
                  style: TextStyle(
                    color: Color(0xFFCFC6E1),
                    fontSize: 28,
                    fontFamily: "Times New Roman"
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Pinput(
              length: 6,
              onCompleted: (val) async {
                try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: widget._verificationId, smsCode: val);
                await auth.signInWithCredential(credential).then(
                      (value) => Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(),),));
                // await auth.signInWithCredential(credential).then(value) => {
                //   print('Logged In Successfully'),
                // };
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'invalid-verification-code') {
                    setState(() {
                      _showError = true; // Show the error message
                    });
                  }
                  else {
                    Text(e.message != null ? e.message! : 'An error occurred');
                  }
                }
              }
            ),
            Visibility(
              visible: _showError, // Control visibility based on state
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0), // Add some spacing
                child: Text(
                  "Incorrect verification Code. Try again",
                  style: TextStyle(color: Colors.red), // Customize style if needed
                ),
              ),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/moon.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}