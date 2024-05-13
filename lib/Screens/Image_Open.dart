import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Print_Preview.dart';

late List<CameraDescription> cameras;
class Image_Open extends StatefulWidget {
  const Image_Open({super.key});

  @override
  State<Image_Open> createState() => _Image_OpenState();
}

class _Image_OpenState extends State<Image_Open> {
  late CameraController cameracontroller;
  late bool isFlashOn = false;
  late Future<void> cameraValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameracontroller = CameraController(cameras[0], ResolutionPreset.max);
    cameraValue = cameracontroller.initialize();
  }
  @override
  void dispose(){
    super.dispose();
    cameracontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(children: [
          FutureBuilder(future: cameraValue, builder: (context, snapshot){
            if(snapshot.connectionState==ConnectionState.done)
            {
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: CameraPreview(cameracontroller));
            }
            else {
              return Center(child: CircularProgressIndicator(),);
            }
          },),
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
                icon: Icon(Icons.close_sharp),
                iconSize: 30,
                onPressed: () {
                  Future.delayed(Duration(milliseconds: 0), () {
                    Navigator.pop(context);
                  });
                },
                color: Colors.orange,
              ),
            ),
          ),
          Positioned(
            right: 40.0,
            top: 110.0,
            child: IconButton(onPressed: (){
              setState(() {
                isFlashOn = !isFlashOn;
                if (isFlashOn)
                {
                  cameracontroller.setFlashMode(FlashMode.torch);
                }
                else {
                  cameracontroller.setFlashMode(FlashMode.off);
                }
              });
            }, icon: Icon(Icons.flash_on_rounded, color: Colors.orange, size: 30,)
            ),
          ),
          Positioned(
            left: (screenWidth- 380/2)-(screenWidth - 380),
            bottom: 80.0,
            child: SizedBox(
              width: screenWidth - 380,
              height: 70,
              child: ElevatedButton(
                onPressed: (){takepic(context);},
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
      ),
    );
  }
  void takepic(BuildContext context) async {
    final image = await cameracontroller.takePicture();
    // Dispose of the camera controller before navigating to the next page
    cameracontroller.dispose();
    Navigator.push(context,MaterialPageRoute(builder: (context) => Print_Preview(imagepath: image.path)),);
  }

}
