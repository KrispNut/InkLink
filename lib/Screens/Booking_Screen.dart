import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
import 'package:travel_app/Models/Buttons_Data.dart';
import 'package:travel_app/Buttons/Overview_Panel.dart';

class Booking_Screen extends StatefulWidget {
  final Booking_Screen_Data data;

  const Booking_Screen({Key? key, required this.data}) : super(key: key);

  @override
  State<Booking_Screen> createState() => _Booking_ScreenState();
}

class _Booking_ScreenState extends State<Booking_Screen> {
  var topic;

  callback(varTopic) {
    setState(() {
      topic = varTopic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
              child:
                  Overview_Panel(data: widget.data, callbackFunction: callback),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Overwiew',
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Reviews',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 0, 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Builder(
                  builder: (BuildContext context) {
                    if (widget.data.condition == 'first') {
                      return Text(
                        widget.data.description,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      );
                    } else {
                      return Text(
                        widget.data.description,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: SizedBox(
              height: 120,
              width: 400,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                ),
                child: Text(
                  'Book now',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
