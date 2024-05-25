import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                        'Credits',
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
                Text(
                  'This is about our app and what have we done to achieve the it. Reach out to us for any issues related.',
                  style: TextStyle(
                    wordSpacing: 10,
                    leadingDistribution: TextLeadingDistribution.even,
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Matrix',
                  ),
                ),
                const SizedBox(height: 60),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 0), () {});
                    },
                    child: const Text(
                      'suitableforwork@gmail.com',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.orange,
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