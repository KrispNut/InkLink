import 'package:flutter/material.dart';

class Collect_Document_screen extends StatelessWidget {
  const Collect_Document_screen({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/Man on kick scooter using holographic map for navigation.png', height: 300),
            const SizedBox(height: 20),
            const Text(
              'Collect Your Documents',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Matrix',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'From Book Shop, Near Cafeteria',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Matrix',
              ),
            ),
            const SizedBox(height: 200),
            Container(
              height: 50,
              width: screenWidth - 250,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Future.delayed(Duration(milliseconds: 0), () {
                    Navigator.pushNamedAndRemoveUntil(context, '/home-screen', (route) => false);
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
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Matrix',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
