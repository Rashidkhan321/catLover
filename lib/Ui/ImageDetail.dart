import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ImageDetail extends StatefulWidget {
  final imageurl;
  const ImageDetail({Key? key, required this.imageurl}) : super(key: key);

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  bool loading =false;

  saveimage()async{
    setState(() {
      loading=true;
    });
    await GallerySaver.saveImage(widget.imageurl).then((value) => {
    setState(() {
    loading=false;
    }),
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('downloaded..')))
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.network(
            widget.imageurl,
            fit: BoxFit.cover,
          ),
        ),
      floatingActionButton: FloatingActionButton(onPressed: (){

        saveimage();
      },
        backgroundColor: Colors.black,
      child: loading?CircularProgressIndicator(color: Colors.white,):Icon(Icons.cloud_download,color: Colors.white,),),
    );
  }
}
