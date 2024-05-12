import 'package:flutter/material.dart';
import 'package:travel_app/Models/Buttons_Data.dart';
import 'package:travel_app/icons.dart';

class Travel_Button extends StatelessWidget {

  final Travel_Button_Data data;

  const Travel_Button({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
      child: SizedBox(
        height: data.height,
        width: data.width,
        child: ElevatedButton(
          onPressed: () {
            bool isConditionMet = data.condition == 'first';
            if (isConditionMet) {
              Navigator.pushNamed(context, '/booking-screen-0');
            } else {
              Navigator.pushNamed(context, '/booking-screen-1');
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey.shade300,
            backgroundColor: data.backgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Column(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  height: 180,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage(data.asset),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget> [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: data.text,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        TextSpan(
                          text: data.text1,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(11, 15, 0, 0),
                    child: IconButton(
                    onPressed: () {},
                      icon: const Icon(MyFlutterApp.glass_heart),
                      color: Colors.deepOrange,
                      alignment: Alignment.topRight,
                      iconSize: 33,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}