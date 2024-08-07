import 'package:flutter/material.dart';

class Begin_Page extends StatelessWidget {

const Begin_Page({super.key});
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0x010310),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(-statusBarHeight),
        child: Container(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF282a57).withOpacity(0.5), Colors.black],begin: Alignment.topCenter,end: Alignment.bottomCenter),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            const Text(textAlign: TextAlign.center,'Let’s Start!',style: TextStyle(color: Colors.white,fontSize: 60, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
            //const SizedBox(height: 100.0),
            Image.asset('assets/images/No connection.png',height: 500),
            const SizedBox(height: 200),
            Container(
              height: 50,
              width: screenWidth - 30,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Future.delayed(Duration(milliseconds: 100), () {
                    Navigator.pushNamed(context, '/home-screen');
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ), child: const Text('Log in',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Matrix'),),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 50,
              width: screenWidth - 30,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40.0),
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Future.delayed(Duration(milliseconds: 100), () {
                    Navigator.pushNamed(context, '/home-screen');
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.transparent,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ), child: const Text('Sign up',style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Matrix'),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}