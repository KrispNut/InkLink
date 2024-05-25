import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'Print_Preview.dart';

class ImageListViewApp extends StatefulWidget {
  @override
  _ImageListViewAppState createState() => _ImageListViewAppState();
}

class _ImageListViewAppState extends State<ImageListViewApp> {
  late List<String> _imagePaths = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
    Timer.periodic(Duration(seconds: 30), (Timer timer) {
      if (mounted) {
        _loadImages();
      }
    });
  }

  Future<void> _loadImages() async {
    final Directory photoDir = Directory('/storage/emulated/0/Pictures');
    var imageList = photoDir
        .listSync()
        .where((item) => item.path.endsWith(".jpg"))
        .toList();

    imageList.sort((a, b) {
      var aModified = File(a.path).lastModifiedSync();
      var bModified = File(b.path).lastModifiedSync();
      return bModified.compareTo(aModified);
    });

    if (mounted) {
      setState(() {
        _imagePaths =
            imageList.map((item) => item.path).toList(growable: false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadImages(),
      builder: (context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: _imagePaths.length,
            itemBuilder: (context, index) {
              File file = File(_imagePaths[index]);
              String name = file.path.split('/').last;
              return ListTile(
                contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                title: Text(
                  name,
                  selectionColor: Colors.orange,
                  style: TextStyle(color: Colors.white),
                ),
                leading: Image.file(file,
                    fit: BoxFit.cover, width: 120, height: 120),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Print_Preview(imagepath: _imagePaths[index]),
                      ));
                },
              );
            },
          );
        }
      },
    );
  }
}
