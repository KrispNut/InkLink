import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Screens/Login_screen.dart';
import 'package:travel_app/Screens/Payment.dart';
import 'package:travel_app/Screens/Signup_screen.dart';
import 'package:travel_app/Screens/Splash_screen.dart';
import 'package:travel_app/Screens/Start_screen.dart';
import 'package:travel_app/Screens/Dashboard.dart';
import 'package:travel_app/Screens/Image_Open.dart';
import 'package:travel_app/Screens/Booking_Screen.dart';
import 'package:travel_app/Models/Buttons_Data.dart';
import 'package:travel_app/Screens/Print_Preview.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    routes: {
      '/': (context) => Splash_screen(),
      '/start-screen': (context) => Start_screen(),
      '/login-screen': (context) => Login_screen(),
      '/signup-screen': (context) => Signup_screen(),
      '/home-screen': (context) => Dashboard(),
      '/camera-screen': (context) => Image_Open(),
      '/payment-screen': (context) => Payment(),
      '/booking-screen-0': (context) => Booking_Screen(data: Homepage_Model.booking_screen_data[0],),
      '/booking-screen-1': (context) => Booking_Screen(data: Homepage_Model.booking_screen_data[1],),
    },
  ));
}
