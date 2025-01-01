import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_registeration/profile.dart';
import 'package:flutter_registeration/registeration.dart';
import 'package:flutter_registeration/services/firebaseaueth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  // Define TextEditingControllers for each field to manage input values
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Define GlobalKey for Form validation
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Color.fromARGB(255, 127, 32, 156),
      ),
      body: GestureDetector(
        onTap: () {
          // Close the keyboard when tapping outside the TextField
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Form key for validation
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50), // Spacing from the top
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // Username TextField with validation
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'email',
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: Color.fromARGB(255, 241, 212, 240),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Password TextField with validation
                TextFormField(
                  controller: _passwordController,
                  obscureText: true, // to hide the password
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    filled: true,
                    fillColor: Color.fromARGB(255, 241, 212, 240),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.infinity, 40),
                    backgroundColor: Color.fromARGB(255, 127, 32, 156),
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    // Navigate to the Sign Up page
                    await login(
                        email: _usernameController.text,
                        password: _passwordController.text,
                        context: context);
                    setState(() {
                      isLoading = false;
                    });
                  }, // Trigger login when pressed
                  child:isLoading? CircularProgressIndicator(): const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 15),
                // Forgot Password Button
                TextButton(
                  onPressed: () {
                    // Navigate to the forgot password screen
                    // You can create another screen or show a dialog
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 32, 156),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Sign Up Button (to navigate to Sign Up page)
                TextButton(
                  onPressed: () {
                    // Navigate to the Sign Up page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Registeration()));
                  },
                  child: const Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 32, 156),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
