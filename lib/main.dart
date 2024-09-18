import 'dart:developer';

import 'package:flutter/material.dart';
import 'logged_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Wow this is cool'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 225,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               const TextField(
                decoration: InputDecoration(
                    hintText: "Username"
                ),
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password"
                ),
              ),
              const CheckboxListTile(
                title: Text("Remember me"),
                value: true,
                onChanged: null
              ),
              ElevatedButton(
                  onPressed: () {
                    log("Button pressed");
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => const LoggedIn()));
                  },
                  child: const Text("Log in")
              ),
            ],
          ),
        )
      ),
    );
  }
}
