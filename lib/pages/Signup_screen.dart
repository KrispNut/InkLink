import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';
import '../firebase_auth_implementation/toast.dart';
import 'Dashboard.dart';

class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});
  @override
  State<Signup_screen> createState() => _Signup_screen_State();
}

class _Signup_screen_State extends State<Signup_screen> {
  bool _obscureText = true;
  final double toolbarOpacity = 2.0;
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0x00010310),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(-statusBarHeight),
        child: Container(),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xFF282a57).withOpacity(0.5),
              Colors.black
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 10.0),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0x00363636),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      iconSize: 30,
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 0), () {
                          Navigator.pop(context);
                        });
                      },
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 90.0),
                  const Text(
                    textAlign: TextAlign.center,
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Matrix'),
                  ),
                ],
              ),
              const SizedBox(height: 100.0),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign up by using email',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Matrix'),
                    )),
              ),
              const SizedBox(height: 60.0),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Username',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Matrix'),
                    )),
              ),
              Center(
                child: Opacity(
                  opacity: 1,
                  child: TextFormField(
                    controller: _usernameController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Username is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: screenWidth - 80,
                        maxHeight: 80,
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                      hintText: 'Username',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.3)),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 30, 0, 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'your email',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Matrix'),
                    )),
              ),
              Center(
                child: Opacity(
                  opacity: 1,
                  child: TextFormField(
                    controller: _emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Email is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: screenWidth - 80,
                        maxHeight: 80,
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                      hintText: 'email@gmail.com',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.3)),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 30, 0, 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'your password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Matrix'),
                    )),
              ),
              Center(
                child: Opacity(
                  opacity: 1,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Password is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: screenWidth - 80,
                        maxHeight: 80,
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                      hintText: 'password',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.3)),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              Container(
                height: 50,
                width: screenWidth - 300,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 0), () {
                      _signUp();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: Center(
                    child: isSigningUp
                        ? CircularProgressIndicator(
                            color: Colors.orange,
                          )
                        : Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Matrix'),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Dashboard(user: FirebaseAuth.instance.currentUser!),
        ),
        (route) => false,
      );
    } else {
      showToast(message: "Some error happend");
    }
  }
}
