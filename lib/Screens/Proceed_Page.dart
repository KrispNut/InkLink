import 'package:flutter/material.dart';

class Proceed_Page extends StatelessWidget {

const Proceed_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
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
            const SizedBox(height: 100.0),
            Image.asset('assets/images/secure document.png',height: 200,scale: 2.5),
            const Text(textAlign: TextAlign.center,'Ink Link',style: TextStyle(color: Colors.white,fontSize: 70, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
            const SizedBox(height: 50),
            const Text(textAlign: TextAlign.center,'Instant Ink',style: TextStyle(color: Colors.white,fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
            const Text(textAlign: TextAlign.center,'Print anytime, anywhere. Ink Link \n makes printing effortless.',style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.w100, fontFamily: 'Matrix'),),
            const SizedBox(height: 180),
            Container(
              height: 40,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Future.delayed(Duration(milliseconds: 100), () {
                    Navigator.pushNamed(context, '/begin-page');
                  }
                 );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ), child: const Text('Proceed',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Matrix'),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}