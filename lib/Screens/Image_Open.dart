import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'Print_Preview.dart';

late List<CameraDescription> cameras;
class Image_Open extends StatefulWidget {
  const Image_Open({super.key});

  @override
  State<Image_Open> createState() => _Image_OpenState();
}

class _Image_OpenState extends State<Image_Open> {
  late CameraController cameracontroller;
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
    return Scaffold(
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
            bottom: 0.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(70,0,70,70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.flash_auto_outlined, color: Colors.orange, size: 30,)),
                    IconButton(onPressed: (){takepic(context);}, icon: Icon(Icons.panorama_fish_eye, color: Colors.orange, size: 30,),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.flip_camera_ios, color: Colors.orange),
                    ),
                  ],
                ),
              ),
        ))
      ],),
    );
  }
  void takepic(BuildContext context)async
  {
    final image = await cameracontroller.takePicture();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Print_Preview(imagepath: image.path),));
  }
}
