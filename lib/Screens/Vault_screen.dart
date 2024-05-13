import 'package:flutter/material.dart';

class Vault_screen extends StatelessWidget {
  const Vault_screen({Key? key}) : super(key: key);

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
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pushNamed(context, '/home-screen');
                    },
                    color: Colors.orange,
                  ),
                  SizedBox(width: 30),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,120,0),
                    child: Text(
                      'Vault',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
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
                  itemCount: 20, // Replace 20 with the number of files
                  itemBuilder: (context, index) {
                    // Replace the file name and extension with actual data
                    String fileName = 'File ${index + 1}';
                    String fileExtension = getFileExtension(index);

                    // Map file extensions to corresponding icons
                    Map<String, IconData> fileIcons = {
                      'pdf': Icons.picture_as_pdf, // PDF icon
                      'docx': Icons.description, // DOCX icon
                      'xlsx': Icons.table_chart, // XLSX icon
                      // Add more file extensions and icons as needed
                    };

                    // Get the corresponding icon for the file extension
                    IconData iconData = fileIcons[fileExtension] ?? Icons.insert_drive_file; // Default icon

                    return ListTile(
                      leading: Icon(
                        iconData,
                        size: 40,
                        color: Colors.white,
                      ),
                      title: Text(
                        fileName,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Private',
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

  // Function to get file extension based on index (for demonstration)
  String getFileExtension(int index) {
    if (index % 3 == 0) {
      return 'pdf';
    } else if (index % 3 == 1) {
      return 'docx';
    } else {
      return 'xlsx';
    }
  }
}
