import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../service/authentication_service.dart';

class Forgot_screen extends StatefulWidget {
  const Forgot_screen({super.key});

  @override
  State<Forgot_screen> createState() => _Forgot_screenState();
}

class _Forgot_screenState extends State<Forgot_screen> {
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void handlePasswordReset() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
        Fluttertoast.showToast(msg: "Password reset email sent");
        Navigator.pop(context);
      } catch (e) {
        Fluttertoast.showToast(msg: "Error: ${e.toString()}");
      }
    }
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF282a57).withOpacity(0.5),
                  Colors.black
                ],
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
                          Future.delayed(const Duration(milliseconds: 0), () {
                            Navigator.pop(context);
                          });
                        },
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 60.0),
                    const Text(
                      textAlign: TextAlign.center,
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
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
                      'Enter your email to reset password',
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
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 20),
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
                      controller: _email,
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
                const SizedBox(height: 50.0),
                Container(
                  height: 50,
                  width: screenWidth - 300,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: ElevatedButton(
                    onPressed: handlePasswordReset,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Matrix',
                      ),
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
