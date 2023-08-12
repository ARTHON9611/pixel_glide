import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';

class fullScreen extends StatelessWidget {
  final String url;
  const fullScreen({super.key,required this.url});


  downloadWall(BuildContext context)async{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloading Started")));
    try{
      var imageId= await ImageDownloader.downloadImage(url);
      if(imageId==null){
        print("null");
        return;
      }
      var path = await ImageDownloader.findPath(imageId);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloaded Successfully"),action: SnackBarAction(label: "Open", onPressed: (){print(path);}),));

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Occured $e")));
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,child: Image.network(url,fit: BoxFit.cover,)),
    floatingActionButton: FloatingActionButton(onPressed: (){downloadWall(context);},child: Icon(Icons.download),),);
  }
}