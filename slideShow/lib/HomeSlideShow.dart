import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeSlideShow extends StatefulWidget {
  const HomeSlideShow({Key? key}) : super(key: key);

  @override
  State<HomeSlideShow> createState() => _HomeSlideShowState();
}

class _HomeSlideShowState extends State<HomeSlideShow> {
  List<Image> imageList = [Image.network("https://i.seadn.io/gae/2hDpuTi-0AMKvoZJGd-yKWvK4tKdQr_kLIpB_qSeMau2TNGCNidAosMEvrEXFO9G6tmlFlPQplpwiqirgrIPWnCKMvElaYgI-HiVvXc?auto=format&w=1000", fit: BoxFit.fill),Image.network("https://media.moddb.com/images/members/5/4550/4549205/dog.jpg",fit: BoxFit.fill),Image.network("http://images7.memedroid.com/images/UPLOADED894/5f0502441774c.jpeg",fit: BoxFit.fill)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generico"),
      ),
      body:Center(
      child:ImageSlideshow(
        width: 400,
        height: 500,
        isLoop: true,
        children: [
          for(var item in imageList)
            item
        ],
      )),
    );
  }
}

