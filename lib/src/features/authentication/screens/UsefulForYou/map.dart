import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:safar_kar/src/constants/image_string.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set horizontal padding
    const double horizontalPadding = 16.0;

    return Scaffold(
      appBar: AppBar(title: Text('RAIL MAP'), backgroundColor: Colors.yellow),
      body: PhotoViewGallery.builder(
        scrollPhysics: BouncingScrollPhysics(),
        itemCount: 1,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: const AssetImage(tRailMap),
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
