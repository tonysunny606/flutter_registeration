import 'package:flutter/material.dart';
import 'package:flutter_registeration/login.dart';
import 'package:flutter_registeration/services/firebaseaueth.dart';

class Registeration extends StatefulWidget {
  TextEditingController _usernameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _confirmPasswordController=TextEditingController();
   Registeration({super.key});

  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  // Define TextEditingControllers for each field to manage input values
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Define FocusNodes to manage focus for each TextField
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    // Clean up the controllers and focus nodes when the widget is disposed
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }
bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Close the keyboard when tapping outside the TextField
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50), // Spacing from the top
                Text(
                  'Sign up',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text('Create your account'),
                SizedBox(height: 20),
                // Username TextField with FocusNode
                TextField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode, // Associate FocusNode
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
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
                  onEditingComplete: () {
                    // Move focus to the next field (email)
                    FocusScope.of(context).requestFocus(_emailFocusNode);
                  },
                ),
                SizedBox(height: 15),
                // Email TextField with FocusNode
                TextField(
                  controller: _emailController,
                  focusNode: _emailFocusNode, // Associate FocusNode
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
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
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: () {
                    // Move focus to the next field (password)
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                ),
                SizedBox(height: 15),
                // Password TextField with FocusNode
                TextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode, // Associate FocusNode
                  obscureText: true, // to hide the password
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
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
                  onEditingComplete: () {
                    // Move focus to the next field (confirm password)
                    FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
                  },
                ),
                SizedBox(height: 15),
                // Confirm Password TextField with FocusNode
                TextField(
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocusNode, // Associate FocusNode
                  obscureText: true, // to hide the password
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock),
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
                ),
                SizedBox(height: 20),
                // Sign Up Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.infinity, 40),
                    backgroundColor: Color.fromARGB(255, 127, 32, 156),
                  ),
                  onPressed: () {
                    signup(
                      Username: _usernameController.text, 
                    email: _emailController.text,
                     password: _passwordController.text,
                     context: context
                     );
setState(() {
  isLoading=true;
});
                    
                  },
                  child:isLoading?CircularProgressIndicator(): Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 15),
                Text('Or'),
                MaterialButton(
                  onPressed: () {                   
                    Navigator.pop(context);
},
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 214, 64, 255),
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
