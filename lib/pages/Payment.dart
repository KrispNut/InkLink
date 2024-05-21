import 'package:flutter/material.dart';
import 'package:inklink/pages/Payment_Successful_screen.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: true,
      child: Scaffold(
        //resizeToAvoidBottomInset : false,
        backgroundColor: const Color(0x00010310),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(-statusBarHeight),
          child: Container(),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0x00ffffff).withOpacity(0.5),
                  Colors.black
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: screenWidth,
                height: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0x00ffffff).withOpacity(0.5),
                    Colors.black
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 20,
              child: Container(
                height: 70,
                width: 40,
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
            ),
            const Positioned(
              top: 180,
              left: 30,
              child: Text(
                'Payment 💳 ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Matrix'),
              ),
            ),
            const Positioned(
              top: 180,
              right: 30,
              child: Text(
                '2050 Rs',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Matrix'),
              ),
            ),
            const Positioned(
              top: 205,
              right: 30,
              child: Text(
                'TVA included (18%)',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Matrix'),
              ),
            ),
            Positioned(
              top: 330,
              left: 22,
              child: Container(
                height: 80,
                width: screenWidth - 265,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0x00ffffff).withOpacity(1),
                    Colors.green.shade400
                  ], begin: Alignment.bottomRight, end: Alignment.topCenter),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: const Text(
                    'JazzCash',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Matrix'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 330,
              right: 22,
              child: Container(
                height: 80,
                width: screenWidth - 265,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0x00ffffff).withOpacity(1),
                    Colors.blueGrey.shade800
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: const Text(
                    'Credit',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Matrix'),
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 440,
              left: 22,
              child: Text(
                'Phone No:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Matrix'),
              ),
            ),
            const Positioned(
              top: 520,
              left: 52,
              child: Text(
                '0323-9441052',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Matrix'),
              ),
            ),
            const Positioned(
              top: 600,
              left: 22,
              child: Text(
                'Holder:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Matrix'),
              ),
            ),
            const Positioned(
              top: 680,
              left: 52,
              child: Text(
                'John Doe',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Matrix'),
              ),
            ),
            const Positioned(
              top: 870,
              left: 52,
              child: Text(
                ' We will send you order details to your email \n       address after successful payment.',
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Matrix'),
              ),
            ),
            Positioned(
              bottom: 20,
              left: (screenWidth / 2) - 90,
              child: Container(
                height: 50,
                width: screenWidth - 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0x00ffffff).withOpacity(0.5),
                    Colors.black
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 100), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Payment_Successful_screen()),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: const Text(
                    'Pay',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Matrix'),
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
