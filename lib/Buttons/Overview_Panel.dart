import 'package:flutter/material.dart';
import 'package:travel_app/Models/Buttons_Data.dart';
import 'package:travel_app/icons.dart';


class Overview_Panel extends StatelessWidget {

  final Booking_Screen_Data data;
  final Function callbackFunction;
  const Overview_Panel({Key? key, required this.data, required this.callbackFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(30.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {},
              child: Ink.image(image: AssetImage(data.asset),height: data.height,width: data.width,fit: BoxFit.cover,),
            ),
        ),
        Positioned(
          top: 30,
          left: 20,
          child: IconButton(
            splashColor: Colors.red,
            onPressed: () {
              Navigator.pop(context);
              },
            icon: const Icon(MyFlutterApp.left_open),
            color: Colors.deepOrange,
            alignment: Alignment.topRight,
            iconSize: 33,
          ),
        ),
        Positioned(
          top: 30,
          right: 20,
          child: IconButton(
            splashColor: Colors.red,
            onPressed: () {},
            icon: const Icon(MyFlutterApp.glass_heart),
            color: Colors.deepOrange,
            alignment: Alignment.topRight,
            iconSize: 33,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 100,
          child: IgnorePointer(
            child: Opacity(
              opacity: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(0.0),
                    bottom: Radius.circular(30.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          left: 30,
          child: IgnorePointer(
            child: Text(data.text,style: const TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold,),),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 30,
          child: IgnorePointer(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: data.text1,style: const TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                  TextSpan(text: data.text2,style: const TextStyle(color: Colors.white60,fontSize: 20,fontWeight: FontWeight.normal),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
