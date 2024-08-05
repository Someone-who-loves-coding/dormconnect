import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'otp.dart';
import 'package:image/image.dart' as img;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _mobile;
  late String _ccode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 258),
              const Text(
                "Enter Phone Number:",
                style: TextStyle(
                  color: Color(0xFFCFC6E1),
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 30),
              Pinput(
                length: 10,
                autofocus: true,
                defaultPinTheme: PinTheme(
                  padding: const EdgeInsets.all(1),
                  height: 37,
                  width: 37,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCFC6E1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    _mobile = val;
                  });
                },
                onCompleted: (val) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OTP(_mobile)));
                },
              ),
              const Spacer(),
              Image.asset(
                "assets/images/moon.png",
                fit: BoxFit.cover, // Adjust the fit as needed
              )
            ],
          ),
        ),
      ),
    );
  }
}
