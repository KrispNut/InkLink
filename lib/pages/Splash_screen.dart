import 'package:flutter/material.dart';
import 'Start_screen.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100.0),
              Image.asset('assets/images/secure document.png',
                  height: 200, scale: 2.5),
              const Text(
                'Ink Link',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Anurati',
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Instant Ink',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Matrix',
                ),
              ),
              const Text(
                'Print anytime, anywhere. Ink Link \n makes printing effortless.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'Matrix',
                ),
              ),
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
                    Future.delayed(const Duration(milliseconds: 0), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Start_screen()),
                      );
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
                    'Proceed',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Matrix'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
