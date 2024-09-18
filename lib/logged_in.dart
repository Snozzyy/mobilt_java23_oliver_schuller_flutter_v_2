import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const LoggedIn());
}

class LoggedIn extends StatelessWidget {
  const LoggedIn({super.key});

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
      home: const LoggedInPage(title: 'Wow this is cool'),
    );
  }
}

class LoggedInPage extends StatefulWidget {
  const LoggedInPage({super.key, required this.title});

  final String title;

  @override
  State<LoggedInPage> createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Welcome",
                style: TextStyle(
                  fontSize: 40
                ),
              ),
              Image.network("https://picsum.photos/250?image=9")
            ],
          ),
        ),
      ),
    );
  }
}
