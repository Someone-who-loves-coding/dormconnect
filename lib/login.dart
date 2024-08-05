import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'otp.dart';
import 'package:country_code_picker/country_code_picker.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   late String _mobile, _ccode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("DormConnect")),
          backgroundColor: Colors.purple.shade100,
      ),
      body: Stack(
        children: [
          Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Background.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text("Mobile Number"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CountryCodePicker(
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(
                        color: Colors.black
                      ),
                      flagWidth: 12,
                      onChanged: (val) {
                        _ccode = val.toString();
                      },
                      favorite: ['+91','IN'],
                    ),
                    Expanded(
                      child: Pinput(
                        length: 10,
                        autofocus: true,
                        onChanged: (val) {
                          setState(() {
                            _mobile = val.toString();
                          });
                        },
                        onCompleted: (val) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OTP()));
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const CircleBorder(side: BorderSide())),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OTP()));
                        },
                        child: const Icon(Icons.navigate_next_rounded)
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(bottom: 20,right: 40)
                )
              ],
            ),
          ),
        ),
      ]
      ),
    );
  }
}
