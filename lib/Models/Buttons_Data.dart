import 'package:flutter/material.dart';

class Homepage_Model {
  static final categories_button_data = [
    Categories_Button_Data(
      textColor: Colors.black,
      backgroundColor: Colors.white,
      text: 'Camp',
      asset: 'assets/images/Camp.jpg',
      icon: Icons.card_giftcard,
      iconColor: Colors.white,
      height: 95,
      width: 170,
      iconsize: 40,
      fontsize: 20,
    ),
    Categories_Button_Data(
      textColor: Colors.black,
      backgroundColor: Colors.white,
      text: 'Mountain',
      asset: 'assets/images/Mountain.jpg',
      icon: Icons.superscript_outlined,
      iconColor: Colors.white,
      height: 95,
      width: 200,
      iconsize: 40,
      fontsize: 20,
    ),
    Categories_Button_Data(
      textColor: Colors.black,
      backgroundColor: Colors.white,
      text: 'Tropical',
      asset: 'assets/images/Tropical.jpg',
      icon: Icons.superscript_outlined,
      iconColor: Colors.white,
      height: 95,
      width: 200,
      iconsize: 40,
      fontsize: 20,
    ),
    Categories_Button_Data(
      textColor: Colors.black,
      backgroundColor: Colors.white,
      text: 'Tropical',
      asset: 'assets/images/Tropical.jpg',
      icon: Icons.superscript_outlined,
      iconColor: Colors.white,
      height: 95,
      width: 200,
      iconsize: 40,
      fontsize: 20,
    ),

  ];
  static final travel_button_data = [
    Travel_Button_Data(
      textColor: Colors.orange,
      backgroundColor: Colors.white,
      condition: 'first',
      text: 'Banjir Kanal\n',
      text1: 'Camp',
      asset: 'assets/images/Banjir_Canal.jpg',
      icon: Icons.email_outlined,
      iconsize: 70,
      iconColor: Colors.white,
      height: 300,
      width: 230,
      fontsize: 40,
    ),
    Travel_Button_Data(
      textColor: Colors.orange,
      backgroundColor: Colors.white,
      condition: 'second',
      text: 'Jatibarang\n',
      text1: 'Lake',
      asset: 'assets/images/Jatibarang.jpg',
      icon: Icons.email_outlined,
      iconsize: 70,
      iconColor: Colors.white,
      height: 300,
      width: 230,
      fontsize: 40,
    ),
  ];
  static final booking_screen_data = [
    Booking_Screen_Data(
      textColor: Colors.orange,
      backgroundColor: Colors.white,
      text: 'Banjir\nKanal',
      text1: "\$90",
      text2: "/person",
      condition: 'first',
      description: "Banjir Kanal is renowned for its picturesque natural surroundings, serene waterways, and diverse recreational offerings. Those who venture here can relish leisurely moments along the water's edge, embark on boat rides, try their hand at fishing, and even embark on exploratory journeys through nearby hiking paths.",
      asset: 'assets/images/Banjir_Canal.jpg',
      icon: Icons.email_outlined,
      iconsize: 60,
      iconColor: Colors.white,
      height: 600,
      width: 450,
      fontsize: 30,
    ),
    Booking_Screen_Data(
      textColor: Colors.orange,
      backgroundColor: Colors.white,
      text: 'Jatibarang\nResorvoir',
      text1: "\$120",
      text2: "/person",
      condition: 'second',
      description: "Jatibarang Reservoir is known for its beautiful natural scenery, tranquil waters, and recreational activities. Visitors can enjoy picnics by the water, go boating, fishing, and even explore nearby hiking trails.",
      asset: 'assets/images/Jatibarang.jpg',
      icon: Icons.email_outlined,
      iconsize: 60,
      iconColor: Colors.white,
      height: 600,
      width: 450,
      fontsize: 30,
    ),
  ];

}
class Categories_Button_Data {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final String asset;
  final double height;
  final double width;
  final double iconsize;
  final double fontsize;
  final Color iconColor;
  final IconData? icon;
  final bool? isIcon;

  Categories_Button_Data({required this.backgroundColor, required this.text, required this.asset, required this.height, required this.width, required this.iconsize, required this.iconColor, required this.fontsize, this.icon, this.isIcon, required this.textColor
  });
}
class Travel_Button_Data {
  final Color textColor;
  final Color backgroundColor;
  final String condition;
  final String text;
  final String text1;
  final String asset;
  final IconData? icon;
  final Color iconColor;
  final double height;
  final double width;
  final double iconsize;
  final double fontsize;

  Travel_Button_Data({required this.textColor, required this.backgroundColor, required this.condition, required this.text, required this.text1, required this.asset, required this.icon, required this.iconColor, required this.height, required this.width, required this.iconsize, required this.fontsize,});
}
class Booking_Screen_Data {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final String text1;
  final String text2;
  final String condition;
  final String description;
  final String asset;
  final IconData? icon;
  final Color iconColor;
  final double height;
  final double width;
  final double iconsize;
  final double fontsize;

  Booking_Screen_Data({required this.textColor, required this.backgroundColor, required this.text, required this.text1, required this.text2, required this.condition, required this.description, required this.asset, required this.icon, required this.iconColor, required this.height, required this.width, required this.iconsize, required this.fontsize,});
}


