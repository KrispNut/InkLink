import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'Print_Preview.dart';

class Image_Open extends StatefulWidget {
  final List<CameraDescription> cameras;
  const Image_Open({super.key, required this.cameras});

  @override
  State<Image_Open> createState() => _Image_OpenState();
}

class _Image_OpenState extends State<Image_Open> {
  late CameraController cameracontroller;
  late bool isFlashOn = false;
  late Future<void> cameraValue;

  @override
  void initState() {
    super.initState();
    cameracontroller =
        CameraController(widget.cameras[0], ResolutionPreset.max);
    cameraValue = cameracontroller.initialize();
    cameracontroller.setFlashMode(FlashMode.off);
  }

  @override
  void dispose() {
    cameracontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: CameraPreview(cameracontroller),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Positioned(
              left: 40.0,
              top: 100.0,
              child: Container(
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: IconButton(
                  icon: const Icon(Icons.close_sharp),
                  iconSize: 30,
                  onPressed: () {
                    // Navigate back when the close button is pressed
                    Navigator.pop(context);
                  },
                  color: Colors.orange,
                ),
              ),
            ),
            Positioned(
              right: 40.0,
              top: 110.0,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isFlashOn = !isFlashOn;
                    if (isFlashOn) {
                      cameracontroller.setFlashMode(FlashMode.torch);
                    } else {
                      cameracontroller.setFlashMode(FlashMode.off);
                    }
                  });
                },
                icon: const Icon(
                  Icons.flash_on_rounded,
                  color: Colors.orange,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              left: (screenWidth - 380 / 2) - (screenWidth - 380),
              bottom: 80.0,
              child: SizedBox(
                width: screenWidth - 380,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    takepic(context);
                  },
                  child: Image.asset(
                    'assets/images/qr-code.png',
                    width: 45,
                    height: 45,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void takepic(BuildContext context) async {
    if (isFlashOn) {
      Future.delayed(const Duration(seconds: 0), () {
        setState(() {
          isFlashOn = false;
          cameracontroller.setFlashMode(FlashMode.off);
        });
      });
    }
    final image = await cameracontroller.takePicture();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Print_Preview(imagepath: image.path),
      ),
    );
    await Gal.putImage(image.path);
    Future.delayed(const Duration(seconds: 3), () async {
      await cameracontroller.dispose();
    });
  }
}
