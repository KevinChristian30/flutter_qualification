import 'package:flutter/material.dart';
import 'package:flutter_qualification/models/user_model.dart';
import 'package:flutter_qualification/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? emailErrorMessage;
  String? passwordErrorMessage;

  SharedPreferences? prefs;

  void resetErrorMessage() {
    setState(() {
      emailErrorMessage = null;
      passwordErrorMessage = null;
    });
  }

  void handleLogin() {
    resetErrorMessage();
  
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty) {
      setState(() {
        emailErrorMessage = "Email Can't be Empty";
      });
      
      return;
    }

    if (email.length <= 8) {
      setState(() {
        emailErrorMessage = "Email's length must be more than 8";
      });

      return;
    }

    if (!email.contains('@gmail.com')) {
      setState(() {
        emailErrorMessage = "Email must contain '@gmail.com'";
      });

      return;
    }

    if (password.isEmpty) {
      setState(() {
        passwordErrorMessage = "Password can't be empty";
      });

      return;
    }

    if (!User.isValidCredentials(email, password)) {
      const snackBar = SnackBar(
        content: Text('Invalid Credentials'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    prefs?.setString("currentUserEmail", email);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPage(email: email)),
    );
  }

  void intializeSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    
    intializeSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StucKC in the Movie"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 80,
              height: 80,
            ),
            const Text(
              "Login",
              style: TextStyle( 
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Email',
                errorText: emailErrorMessage,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Password',
                errorText: passwordErrorMessage
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {handleLogin();}, 
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Login"),
            ),
          ],
        ),
      )
    );
  }
}