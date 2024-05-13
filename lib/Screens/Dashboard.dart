import 'package:flutter/material.dart';
import 'package:travel_app/Buttons/Buttons.dart';
import 'package:travel_app/Screens/Image_Open.dart';



class Dashboard extends StatefulWidget {

  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard_State();
}

class _Dashboard_State extends State<Dashboard> {

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
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: const Text('Dashboard ',style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
              ),
              const SizedBox(height: 30),
              Center(
                child: Opacity(
                  opacity: 1,
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.normal, fontFamily: 'Matrix'),
                    controller: _searchController,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(maxWidth: screenWidth-80,maxHeight: 80),
                      contentPadding: EdgeInsets.fromLTRB(20, 1, 1, 1),
                      hintText: 'Search for places...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search, color: Colors.white),
                        onPressed: () => _searchController.clear(),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                children: [
                  Button(text: "Vault", imageAsset: 'assets/images/Bank Safe.png', description: '120 Files',),
                  Button(text: "Document", imageAsset: 'assets/images/Red File.png', description: '57 Files',),
                  Button(text: "Drive", imageAsset: 'assets/images/Google Drive.png', description: '41 Files',),
                  Button(text: "Gallery", imageAsset: 'assets/images/Gallery.png', description: '72 Files',),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,50,0,0),
                child: const Text('Recent',style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Matrix'),),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: SizedBox(
              width: screenWidth - 380,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Future.delayed(Duration(milliseconds: 0), () {
                    Navigator.pushNamedAndRemoveUntil(context,'/camera-screen',(Route route) => true,);
                    },
                  );
                },
                child: Icon(Icons.document_scanner),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}