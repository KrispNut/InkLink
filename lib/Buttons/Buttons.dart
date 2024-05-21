import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import for image picker
import 'package:travel_app/Models/Buttons_Data.dart';

class Button extends StatelessWidget {
  final String text;
  final String imageAsset;
  final String description;
  const Button({super.key, required this.text, required this.imageAsset, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 200,
      child: ElevatedButton(
        onPressed: () async {
          // Access the gallery and handle the picked image
          final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

          // Check if image was picked successfully
          if (pickedFile != null) {
            // Handle the picked image (e.g., display, upload)
            // You can access the image path using pickedFile.path
            print('Image path: ${pickedFile.path}'); // For demonstration
          } else {
            print('No image selected.');
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey,
          backgroundColor: Color.fromARGB(200, 62, 68, 82),
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
                image: DecorationImage(
                  image: AssetImage(imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            RichText(
              text: TextSpan(
                text: text + '\n',
                children: [
                  TextSpan(
                    text: description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
