import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      routes: {
        "/home": (context) => const LoggedIn()
      },
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

  String username = "";
  String password = "";
  bool rememberMe = false;

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    loadData();
    usernameController = TextEditingController(text: username);
    passwordController = TextEditingController(text: password);
    super.initState();
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      username = prefs.getString("username") ?? "";
      password = prefs.getString("password") ?? "";
      rememberMe = prefs.getBool("rememberMe") ?? false;
    });

  }

  @override
  Widget build(BuildContext context) {
    loadData();
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
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: "Username"
                ),
              ),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password"
                ),
              ),

              CheckboxListTile(
                title: const Text("Remember me"),
                value: rememberMe,
                onChanged: (bool? newValue) {
                  setState(() {
                    rememberMe = newValue!;
                    updateRememberMe();
                  });
                }
              ),

              ElevatedButton(
                  onPressed: () {
                    if (rememberMe = true) {
                      username = usernameController.text;
                      password = passwordController.text;

                      updateUsername();
                      updatePassword();

                    } else {
                      clearPreferences();
                    }

                    Navigator.pushNamed(context, "/home");
                  },
                  child: const Text("Log in")
              ),
            ],
          ),
        )
      ),
    );
  }

  void updateRememberMe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    prefs.setBool("rememberMe", rememberMe);
    });

  }

  void updateUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString("username", username);
    });
  }

  void updatePassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString("password", password);
    });
  }

  void clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
