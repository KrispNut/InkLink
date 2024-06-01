import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import '../tools/drop_down.dart';
import 'Image_Displaying.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:inklink/pages/Image_Open.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inklink/pages/Print_Preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inklink/pages/Vault_screen.dart';
import '../main.dart';

class Dashboard extends StatefulWidget {
  final User user;
  final String username;

  Dashboard({Key? key, required this.user, required this.username})
      : super(key: key);

  @override
  State<Dashboard> createState() => _Dashboard_State();
}

class _Dashboard_State extends State<Dashboard> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
            _supportState = isSupported;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0x00010310),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(-statusBarHeight),
        child: Container(),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xFF282a57).withOpacity(0.5),
              Colors.black
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ink Link',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Anurati',
                      ),
                    ),
                    const SizedBox(width: 140),
                    Expanded(
                      child: Text(
                        '${widget.user.email?.split('@').first.trim()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Anurati',
                        ),
                      ),
                    ),
                    CustomDropdownMenu(),
                  ],
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
                    onPressed: _authenticate,
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
                      final result = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.custom,
                          allowedExtensions: ['pdf', 'doc', 'docx', 'txt']);
                      if (result != null && result.files.isNotEmpty) {
                        final file = result.files.first;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Print_Preview(
                              file: file,
                              imagepath: file.path ?? '',
                            ),
                          ),
                        );
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
                              image:
                                  AssetImage('assets/images/Google Drive.png'),
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
              const SizedBox(height: 20),
              Expanded(
                child: ImageListViewApp(),
              ),
              const SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: SizedBox(
                    width: screenWidth - 380,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 0), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Image_Open(cameras: cameras),
                            ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Scan to Peek',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      Future.delayed(const Duration(milliseconds: 0), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Vault_screen()),
        );
      });
      print("Authenticated : $authenticated");
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
