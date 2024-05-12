import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_screen extends StatefulWidget {

  const Login_screen({super.key});
  @override
  State<Login_screen> createState() => _Login_screen_State();
}

class _Login_screen_State extends State<Login_screen> {

  final double toolbarOpacity = 2.0;
  int current_index = 0;
  void onTap(int index)
  {
    setState((){
      current_index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();

    return Scaffold(
      //resizeToAvoidBottomInset : false,
      backgroundColor: Color(0x010310),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(-statusBarHeight),
        child: Container(),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF282a57).withOpacity(0.5), Colors.black],begin: Alignment.topCenter,end: Alignment.bottomCenter),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              const SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  const SizedBox(width: 10.0),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0x363636),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 30,
                      onPressed: () {
                        Future.delayed(Duration(milliseconds: 0), () {
                          Navigator.pushNamed(context, '/start-screen');
                        });
                      },
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 90.0),
                  Text(textAlign: TextAlign.center,'Log In',style: TextStyle(color: Colors.white,fontSize: 60, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
                ],
              ),
              const SizedBox(height: 100.0),
              const Padding(
                padding: EdgeInsets.fromLTRB(20,0,0,0),
                child: Align(alignment: Alignment.centerLeft,child: Text('Log in by using email',style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),)),
              ),
              const SizedBox(height: 60.0),
              const Padding(
                padding: EdgeInsets.fromLTRB(50,0,0,10),
                child: Align(alignment: Alignment.centerLeft,child: Text('your email',style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),)),
              ),
              Center(
                child: Opacity(
                  opacity: 1,
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.normal, fontFamily: 'Matrix'),
                    controller: _email,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(maxWidth: screenWidth-80,maxHeight: 80),
                      contentPadding: EdgeInsets.fromLTRB(20, 1, 1, 1),
                      hintText: 'email@gmail.com',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50,30,0,10),
                child: Align(alignment: Alignment.centerLeft,child: Text('your password',style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),)),
              ),
        
              Center(
                child: Opacity(
                  opacity: 1,
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.normal, fontFamily: 'Matrix'),
                    controller: _password,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(maxWidth: screenWidth-80,maxHeight: 80),
                      contentPadding: EdgeInsets.fromLTRB(20, 1, 1, 1),
                      hintText: 'password',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye, color: Colors.white),
                        onPressed: () => _password.clear(),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
              Container(
                height: 50,
                width: screenWidth - 30,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 0), () {
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
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/google logo.png', height: 22, width: 22),
                      SizedBox(width: 20),
                      Text('Log in with Google', style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 150),
              Container(
                height: 50,
                width: screenWidth - 300,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 0), () {
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
            ],
          ),
        ),
      ),
    );
  }
}