import 'package:flutter/material.dart';
import 'package:pixel_glide/controller/apiFetch.dart';
import 'package:pixel_glide/models.dart/photo_model.dart';
import 'package:pixel_glide/widgets/custom_app_bar.dart';

class catScreen extends StatefulWidget {
  final String query;
  const catScreen({super.key,required this.query});

  @override
  State<catScreen> createState() => _catScreenState();
}

class _catScreenState extends State<catScreen> {
  List<photoModel> searchwalls=[];
  bool isData=false;
  getCatWalls()async{
    searchwalls= await apiFetch.searchWallpaper(widget.query);
    print(searchwalls);
     setState(() {
      isData=true;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCatWalls();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(title: customAppBar(word1: "Pixel",word2: "Glide",),centerTitle: true,elevation: 0.0,backgroundColor: Colors.white,),
    body: Column(children: [


      Stack(
        children: [isData? Image.network(
          width:MediaQuery.of(context).size.width,
          height:130,
          fit:BoxFit.cover,
          searchwalls[0].imgUrl
          ):CircularProgressIndicator(),
          Container(width: MediaQuery.of(context).size.height,height: 130,color: Colors.black38,),

          Positioned(

            top: 30,
            left: 125,
            child: Column(
            children: [
              Text("Category",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),
              Text("Mountains",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),),
            ],
          ))

          ]
      ),



      Expanded(
        child: SingleChildScrollView(
          child: isData? Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 10),
            height:MediaQuery.of(context).size.height*0.72,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing:10,mainAxisSpacing: 10,mainAxisExtent: 400,), 
            itemCount:searchwalls.length,
            physics:AlwaysScrollableScrollPhysics(),
            itemBuilder: (context,index)=>Container(margin: EdgeInsets.all(4),width: 30,height:100 ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
            child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network(searchwalls[index].imgUrl,width: 30,height: 100,fit:BoxFit.cover,))
            ),
          )
          
          
            ):CircularProgressIndicator(),
        ),
      )],));
  }
}