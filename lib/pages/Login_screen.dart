import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';
import '../firebase_auth_implementation/toast.dart';
import 'Dashboard.dart';
import 'Forgot_screen.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool isSigningIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
            gradient: LinearGradient(
              colors: [const Color(0xFF282a57).withOpacity(0.5), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
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
                        Future.delayed(const Duration(milliseconds: 200), () {
                          Navigator.pop(context);
                        });
                      },
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 90.0),
                  const Text(
                    textAlign: TextAlign.center,
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Matrix',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100.0),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Log in by using email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Matrix',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60.0),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'your email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Matrix',
                    ),
                  ),
                ),
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
              GestureDetector(
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 200), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Forgot_screen()),
                    );
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(50, 30, 0, 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'your password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Matrix',
                      ),
                    ),
                  ),
                ),
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
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 45, 0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 200), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Forgot_screen()),
                        );
                      });
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
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
                    _signIn();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ).copyWith(
                    splashFactory: InkRipple.splashFactory,
                    overlayColor: WidgetStateProperty.all<Color>(
                        Colors.orangeAccent.withOpacity(0.7)),
                  ),
                  child: Center(
                    child: isSigningIn
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Matrix',
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 110),
              Container(
                height: 50,
                width: screenWidth - 180,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      _signInWithGoogle(context);
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/google logo.png',
                          height: 22, width: 22),
                      const SizedBox(width: 20),
                      const Text(
                        'Log in with Google',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Matrix',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      isSigningIn = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      isSigningIn = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Dashboard(user: FirebaseAuth.instance.currentUser!),
        ),
        (route) => false,
      );
    } else {
      showToast(message: "some error occurred");
    }
  }

  _signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Dashboard(user: FirebaseAuth.instance.currentUser!),
          ),
          (route) => false,
        );
      }
    } catch (e) {
      showToast(message: "some error occurred $e");
    }
  }
}
