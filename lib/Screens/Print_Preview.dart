import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Print_Preview extends StatelessWidget {
  Print_Preview({super.key, required this.imagepath});
  String imagepath;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //resizeToAvoidBottomInset : false,
      backgroundColor: Color(0x010310),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(-statusBarHeight),
        child: Container(),
      ),
      body: Stack(
        children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0x3A3C3F).withOpacity(0.5), Colors.black],begin: Alignment.topCenter,end: Alignment.bottomCenter),),
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
                  const Text(textAlign: TextAlign.center,'Preview',style: TextStyle(color: Colors.white,fontSize: 50, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
                ],
              ),
              const SizedBox(height: 40.0),
              Image(
                image: FileImage(File(imagepath)),
                height: 500,
                width: 425,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 250,
            right: 50,
            child: Container(
                width: screenWidth-250,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                ),
              ),
            ),
          const Positioned(
            bottom: 262,
            right: 70,
            child: Text('HP Smart Laser Jet 11325',style: TextStyle(color: Colors.black45,fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
          ),
          const Positioned(
            bottom: 230,
            left: 50,
            child: Text('Copies:',style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
          ),
          const Positioned(
            bottom: 200,
            left: 50,
            child: Text('Paper Size:',style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
          ),
          const Positioned(
            bottom: 170,
            left: 50,
            child: Text('Color:',style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
          ),
          const Positioned(
            bottom: 140,
            left: 50,
            child: Text('Pages:',style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
          ),
          const Positioned(
            bottom: 110,
            left: 50,
            child: Text('Orientation:',style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
          ),
          Positioned(
            bottom: 20,
            left: (screenWidth/2)-90,
            child: Container(
              height: 50,
              width: screenWidth - 300,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Future.delayed(Duration(milliseconds: 0), () {
                    Navigator.pushNamed(context, '/payment-screen');
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey.shade600,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                child: const Text('Print',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,fontFamily: 'Matrix'),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
