import 'package:flutter/material.dart';

import 'otp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Mobile Number"),
          TextField(
            controller: _mobile,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OTP()));
              },
              child: const Icon(Icons.navigate_next_rounded)
          )
        ],
      ),
    );
  }
}
