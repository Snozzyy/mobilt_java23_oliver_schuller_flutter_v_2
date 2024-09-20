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
      home: const MyHomePage(title: 'Epic title'),
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

  var remember = false;

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

              CheckboxListTile(
                title: const Text("Remember me"),
                value: remember,
                onChanged: (bool? newValue) {
                  setState(() {
                    remember = newValue!;
                  });
                }
              ),

              ElevatedButton(
                  onPressed: () {
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
