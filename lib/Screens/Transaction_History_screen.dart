import 'package:flutter/material.dart';

class Transaction_History_screen extends StatelessWidget {
  const Transaction_History_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Color(0x010310),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(-statusBarHeight),
        child: Container(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF282a57).withOpacity(0.5), Colors.black],
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
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.orange,
                  ),
                  SizedBox(width: 30),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
                    child: Text(
                      'Transaction History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Matrix',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    String transactionNumber = 'Transaction ${index + 1}';
                    String date = 'Date: 2024-05-20';

                    return ListTile(
                      leading: Icon(
                        Icons.money,
                        size: 40,
                        color: Colors.lightGreen,
                      ),
                      title: Text(
                        transactionNumber,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        date,
                        style: TextStyle(color: Colors.white),
                      ),
                      // Add onTap callback if needed
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}