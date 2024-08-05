import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatefulWidget {
  final String _mobile;


  OTP(this._mobile, {super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    const assetImage = AssetImage('assets/images/moon2.png');
    final resizeImage = ResizeImage(
      assetImage,
      width: MediaQuery.of(context).size.width.toInt(),
    );
    late String _otp;
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
              onChanged: (val) {
                setState(() {
                  _otp = val;
                });
              },
              onCompleted: (val) {
                  if(val == _otp){
                    print(true);
                  }
                  else print(false);
              },
            ),
            SizedBox(
              height: 100,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset("assets/images/moon2.png"),
                alignment: Alignment.bottomCenter,
              ),
            )
          ],
        ),
      ),
    );
  }
}