import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> imagesToShow = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Toma fotos: '),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              size: 80,
            ))
      ],
    );
  }
}
