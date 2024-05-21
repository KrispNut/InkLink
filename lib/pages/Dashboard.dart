import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inklink/pages/Image_Open.dart';
import 'package:inklink/pages/Print_Preview.dart';
import 'package:inklink/pages/Profile_screen.dart';
import 'package:inklink/pages/Vault_screen.dart';
import 'package:open_file/open_file.dart';

class Dashboard extends StatefulWidget {
  final User user;
  const Dashboard({super.key, required this.user});

  @override
  State<Dashboard> createState() => _Dashboard_State();
}

class _Dashboard_State extends State<Dashboard> {
  void _openFile(PlatformFile file) {
    // Open the file using the appropriate platform-specific method
    OpenFile.open(file.path);
  }

  final double toolbarOpacity = 2.0;
  int current_index = 0;
  void onTap(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0x00010310),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(-statusBarHeight),
        child: Container(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xFF282a57).withOpacity(0.5), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Dashboard ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Matrix'),
                  ),
                ),
                const SizedBox(width: 90),
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0x00363636),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/images/Customer.png',
                          width: 30, height: 30),
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 0), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile_screen()),
                          );
                        });
                      },
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Opacity(
                opacity: 1,
                child: TextField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Matrix'),
                  controller: _searchController,
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                        maxWidth: screenWidth - 80, maxHeight: 80),
                    contentPadding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                    hintText: 'Search for places...',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () => _searchController.clear(),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 0), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Vault_screen()),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: const Color.fromARGB(200, 62, 68, 82),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Bank Safe.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      RichText(
                        text: const TextSpan(
                          text: "Vault" '\n',
                          children: [
                            TextSpan(
                              text: '120 Files',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform
                        .pickFiles(allowMultiple: true);
                    if (result != null && result.files.isNotEmpty) {
                      for (var file in result.files) {
                        _openFile(file);
                      }
                    } else {
                      print('No file selected.');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: const Color.fromARGB(200, 62, 68, 82),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Red File.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      RichText(
                        text: const TextSpan(
                          text: "Document" '\n',
                          children: [
                            TextSpan(
                              text: '57 Files',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Access the gallery and handle the picked image
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);

                    // Check if image was picked successfully
                    if (pickedFile != null) {
                      // Handle the picked image (e.g., display, upload)
                      // You can access the image path using pickedFile.path
                      print(
                          'Image path: ${pickedFile.path}'); // For demonstration
                    } else {
                      print('No image selected.');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: const Color.fromARGB(200, 62, 68, 82),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Google Drive.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      RichText(
                        text: const TextSpan(
                          text: "Drive" '\n',
                          children: [
                            TextSpan(
                              text: '41 Files',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);

                    if (pickedFile != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Print_Preview(imagepath: pickedFile.path),
                          // Pass the imagepath parameter here
                        ),
                      );
                    } else {
                      print('No image selected.');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: const Color.fromARGB(200, 62, 68, 82),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Gallery.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      RichText(
                        text: const TextSpan(
                          text: "Gallery" '\n',
                          children: [
                            TextSpan(
                              text: '72 Files',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
              child: Text(
                'Recent',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Matrix'),
              ),
            ),
          ],
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
                  Future.delayed(const Duration(milliseconds: 100), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Image_Open()),
                    );
                  });
                },
                child: Image.asset(
                  'assets/images/qr-code-white.png',
                  width: 45,
                  height: 45,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
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
