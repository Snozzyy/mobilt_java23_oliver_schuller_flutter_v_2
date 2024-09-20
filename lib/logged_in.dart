import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobilt_java23_oliver_schuller_flutter_v_2/main.dart';

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
      title: 'Epic title',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const LoggedInPage(title: 'Epic title'),
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
  int _selectedIndex = 0;

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

              const Text(
                "Welcome",
                style: TextStyle(fontSize: 40),
              ),

              Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Corvus_corone_-near_Canford_Cliffs%2C_Poole%2C_England-8.jpg/300px-Corvus_corone_-near_Canford_Cliffs%2C_Poole%2C_England-8.jpg"),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
          ],
          currentIndex: _selectedIndex,
          onTap: (int newIndex) {
            _selectedIndex = newIndex;
            switch (_selectedIndex) {
              case 0:
                break;
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
                break;
            }
          }
        ),
    );
  }

   onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      log(_selectedIndex.toString());
    });
  }
}
