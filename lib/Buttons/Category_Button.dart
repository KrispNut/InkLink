import 'package:flutter/material.dart';
import 'package:travel_app/Models/Buttons_Data.dart';

class Category_Button extends StatelessWidget {

  final Categories_Button_Data data;

  const Category_Button({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: SizedBox(
        height: data.height,
        width: data.width,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey,
            backgroundColor: data.backgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage(data.asset),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                data.text,
                style:
                TextStyle(fontSize: data.fontsize, color: data.textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}