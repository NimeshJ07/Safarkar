import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:safar_kar/src/constants/image_string.dart';

class Fares extends StatelessWidget {
  const Fares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set horizontal padding
    const double horizontalPadding = 16.0;

    return Scaffold(
      appBar:
          AppBar(title: Text('FARES CHARTS'), backgroundColor: Colors.yellow),
      body: PhotoViewGallery.builder(
        scrollPhysics: BouncingScrollPhysics(),
        itemCount: 1,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: const AssetImage(tFares),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
            initialScale: PhotoViewComputedScale.contained,
          );
        },
        backgroundDecoration: const BoxDecoration(
          color: Colors.white, // Set the background color to white
        ),
        pageController: PageController(),
      ),
    );
  }
}
