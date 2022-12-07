import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeSlideShow extends StatefulWidget {
  const HomeSlideShow({Key? key}) : super(key: key);

  @override
  State<HomeSlideShow> createState() => _HomeSlideShowState();
}

class _HomeSlideShowState extends State<HomeSlideShow> {
  List<Image> imageList = [Image.asset("lib/images/IMG_2857.jpg"),Image.asset("lib/images/IMG_2876.jpg"),Image.asset("lib/images/IMG_2925.jpg")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generico"),
      ),
      body: ImageSlideshow(
        children: [
          for(var item in imageList)
            item
        ],
      ),
    );
  }
}

