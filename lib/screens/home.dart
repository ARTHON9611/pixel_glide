import 'package:flutter/material.dart';
import 'package:pixel_glide/controller/apiFetch.dart';
import 'package:pixel_glide/screens/category.dart';
import 'package:pixel_glide/screens/full_screen.dart';
import 'package:pixel_glide/screens/search.dart';
import 'package:pixel_glide/widgets/category_wall.dart';
import 'package:pixel_glide/widgets/custom_app_bar.dart';
import 'package:pixel_glide/widgets/search_bar.dart';

class homeScreen extends StatefulWidget {

  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  TextEditingController controller =  new TextEditingController();

   
   List trendingWalls=[];
   List searchWalls=[];
   bool isData = false;
    
  void gettingTrendingImages()async{
    trendingWalls = await apiFetch.getTrendingimages();
    isData=true;
    setState(() {
      
    });
    print("hello");
  }

    @override
  void initState(){
    // TODO: implement initState
    super.initState();
    print("initstate called");
    gettingTrendingImages();
   
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(title: customAppBar(word1: "Pixel",word2: "Glide",),centerTitle: true,elevation: 0.0,backgroundColor: Colors.white,),
    body: Column(children: [searchBar(searchController: controller,query: controller.text),
      isData?SizedBox(height: 90,width: MediaQuery.of(context).size.width,child: ListView.builder(scrollDirection: Axis.horizontal,shrinkWrap: true,itemCount: trendingWalls.length,itemBuilder: (context,index)=>InkWell(onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>catScreen(query: "cars"))),child: catWall(url: trendingWalls[index].imgUrl,query: "Landscape",)))):CircularProgressIndicator(),        
      
      Expanded(
        child: SingleChildScrollView(
          child: isData? SizedBox(
            height:MediaQuery.of(context).size.height,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing:10,mainAxisSpacing: 10,mainAxisExtent: 400,), 
            itemCount: trendingWalls.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>InkWell(
              onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>fullScreen(url:trendingWalls[index].imgUrl )));},
              child: Hero(
                tag: trendingWalls[index].imgUrl,
                child: Container(margin: EdgeInsets.all(4),width: 30,height:100 ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network(trendingWalls[index].imgUrl,width: 30,height: 100,fit:BoxFit.cover,))
                ),
              ),
            ),
          )
          
          
            ):CircularProgressIndicator(),
        ),
      )],));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}