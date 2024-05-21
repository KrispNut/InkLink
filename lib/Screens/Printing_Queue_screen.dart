import 'package:flutter/material.dart';

class Printing_Queue_screen extends StatelessWidget {
  const Printing_Queue_screen({Key? key}) : super(key: key);

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF282a57).withOpacity(0.5), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 80),
            const Text(
              'Ink Link',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
                fontFamily: 'Anurati',
              ),
            ),
            const SizedBox(height: 80),
            const Text(
              'Thankyou for waiting',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Matrix',
              ),
            ),
            const SizedBox(height: 80),
            Image.asset('assets/images/PDF.png', height: 275),
          ],
        ),
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: Printing_Queue_screen(),
    routes: {
      '/home-screen': (context) => Container(),
    },
  ));
}
