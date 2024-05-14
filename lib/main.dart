import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Screens/Collect_Document_screen.dart';
import 'package:travel_app/Screens/Login_screen.dart';
import 'package:travel_app/Screens/Payment.dart';
import 'package:travel_app/Screens/Signup_screen.dart';
import 'package:travel_app/Screens/Splash_screen.dart';
import 'package:travel_app/Screens/Start_screen.dart';
import 'package:travel_app/Screens/Dashboard.dart';
import 'package:travel_app/Screens/Image_Open.dart';
import 'package:travel_app/Screens/Booking_Screen.dart';
import 'package:travel_app/Models/Buttons_Data.dart';
import 'package:travel_app/Screens/Vault_screen.dart';
import 'package:travel_app/Screens/Payment_Successful_screen.dart';
import 'package:travel_app/Screens/Profile_screen.dart';
import 'package:travel_app/Screens/Transaction_History_screen.dart';

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
      '/vault-screen': (context) => Vault_screen(),
      '/profile_screen': (context) => Profile_screen(),
      '/camera-screen': (context) => Image_Open(),
      '/payment-screen': (context) => Payment(),
      '/Payment_Successful_screen': (context) => Payment_Successful_screen(),
      '/collect-document-screen': (context) => Collect_Document_screen(),
      '/Transaction_History_screen': (context) => Transaction_History_screen(),
      '/booking-screen-0': (context) => Booking_Screen(data: Homepage_Model.booking_screen_data[0],),
      '/booking-screen-1': (context) => Booking_Screen(data: Homepage_Model.booking_screen_data[1],),
    },
  ));
}