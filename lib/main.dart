import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        // useMaterial3: true,
        primarySwatch: Colors.blue),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          backgroundColor: Colors.deepPurpleAccent,
          actions: [
            IconButton(
                onPressed: () async {},
                icon: const Icon(Icons.account_box_outlined)
            ),
          ],
        ),
        body: Column(
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              controller: _password,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                final usercredentials = FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                    email: email,
                    password: password
                );
                print(usercredentials);
              },
              child: const Text('Register'),
            ),
          ],
        ));
  }
}