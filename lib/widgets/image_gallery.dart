import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> imagesToShow = [];

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        imagesToShow.add(photo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        if (imagesToShow.isEmpty)
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text('No hay fotos aún'),
            ),
          )
        else
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagesToShow.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(imagesToShow[index].path),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: _takePhoto,
          icon: const Icon(Icons.camera_alt),
          label: const Text('Tomar foto'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }
}
