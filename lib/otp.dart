import 'package:flutter/material.dart';
import 'package:dormconnect/login.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    late String _otp;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Pinput(
            length: 4,
            onChanged: (val) {
              setState(() {
                _otp = val;
              });
            },
            onCompleted: (val) {

            },
          )
        ],
      ),
    );
  }
}
