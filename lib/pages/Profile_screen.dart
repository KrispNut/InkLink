import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inklink/pages/Login_screen.dart';
import 'package:inklink/pages/Start_screen.dart';
import 'package:inklink/pages/Transaction_History_screen.dart';

class Profile_screen extends StatelessWidget {
  const Profile_screen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF282a57).withOpacity(0.5), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        iconSize: 30,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 60),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Matrix',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF193548),
                        Color(0xFF203A43),
                        Color(0xFF2C5364),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 30,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'User Info',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _profileOptionButton(
                        context: context,
                        title: 'Language',
                        icon: Icons.language,
                        color: Colors.green,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 20),
                      _profileOptionButton(
                        context: context,
                        title: 'Transaction',
                        icon: Icons.list_outlined,
                        color: Colors.orangeAccent,
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 0), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Transaction_History_screen()),
                            );
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      _profileOptionButton(
                        context: context,
                        title: 'Log Out',
                        icon: Icons.exit_to_app,
                        color: Colors.red,
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Start_screen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileOptionButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onPressed,
    Color? color,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: color ?? Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
    );
  }
}
