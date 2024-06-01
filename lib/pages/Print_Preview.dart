import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'Dashboard.dart';

class Print_Preview extends StatelessWidget {
  final String imagepath;
  final PlatformFile? file;
  Print_Preview({Key? key, required this.imagepath, this.file})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0x00010310),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(-statusBarHeight),
          child: Container(),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 100.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(width: 10.0),
                      Container(
                        height: 60,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0x00363636),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.transparent,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            iconSize: 30,
                            onPressed: () {
                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Dashboard(
                                      user: FirebaseAuth.instance.currentUser!,
                                      username: '',
                                    ),
                                  ),
                                  (route) => false,
                                );
                              });
                            },
                            color: Colors.orange,
                            splashColor: Colors.orange.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(width: 90.0),
                      const Text(
                        textAlign: TextAlign.center,
                        'Preview',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Matrix',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  Expanded(
                    child: PdfPreview(
                      build: (format) => _generatePdf(format, file, imagepath),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, PlatformFile? file, String imagePath) async {
    final pdf = pw.Document();

    if (file != null) {
      final fileType = _detectFileType(file);

      switch (fileType) {
        case 'image':
          // Use the existing variable for image handling
          final image = pw.MemoryImage(File(imagePath).readAsBytesSync());
          pdf.addPage(
            pw.Page(
              pageFormat: format,
              build: (pw.Context context) {
                return pw.Container(
                  color: PdfColors.white,
                  width: format.availableWidth,
                  height: format.availableHeight,
                  child: pw.Center(
                    child: pw.Image(image),
                  ),
                );
              },
            ),
          );
          break;

        case 'pdf':
          final data = File(file.path!).readAsBytesSync();
          return data;

        case 'text':
          final text = File(file.path!).readAsStringSync();
          pdf.addPage(
            pw.Page(
              pageFormat: format,
              build: (pw.Context context) {
                return pw.Container(
                  color: PdfColors.white,
                  width: format.availableWidth,
                  height: format.availableHeight,
                  child: pw.Text(text),
                );
              },
            ),
          );
          break;

        default:
          throw UnsupportedError('Unsupported file type');
      }
    } else {
      final image = pw.MemoryImage(File(imagePath).readAsBytesSync());
      pdf.addPage(
        pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Container(
              color: PdfColors.white,
              width: format.availableWidth,
              height: format.availableHeight,
              child: pw.Center(
                child: pw.Image(image),
              ),
            );
          },
        ),
      );
    }

    return pdf.save();
  }

  String _detectFileType(PlatformFile file) {
    final extension = file.extension?.toLowerCase();
    if (extension == 'jpg' || extension == 'jpeg' || extension == 'png') {
      return 'image';
    } else if (extension == 'pdf') {
      return 'pdf';
    } else if (extension == 'txt') {
      return 'text';
    } else {
      return 'unknown';
    }
  }
}
