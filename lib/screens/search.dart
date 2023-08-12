import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pixel_glide/controller/apiFetch.dart';
import 'package:pixel_glide/models.dart/photo_model.dart';
import 'package:pixel_glide/screens/home.dart';
import 'package:pixel_glide/widgets/category_wall.dart';
import 'package:pixel_glide/widgets/custom_app_bar.dart';
import 'package:pixel_glide/widgets/search_bar.dart';

class searchScreen extends StatefulWidget {
  String query;

  searchScreen({required this.query});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  TextEditingController controller =  new TextEditingController();
  bool isData=false;
  List<photoModel>  Walls=[];
  searchedWalls()async{
    Walls = await apiFetch.searchWallpaper(widget.query);
    print(Walls);
     setState(() {
       isData=true;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchedWalls();
  }

  @override
  Widget build(BuildContext context) {
    
    Future.delayed(Duration(seconds: 3),(){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        "No WallPapers Found")));
    });
    print(isData);
    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(title: customAppBar(word1: "Pixel",word2: "Glide",),centerTitle: true,elevation: 0.0,backgroundColor: Colors.white,
    leading: InkWell(onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>homeScreen())),child: Icon(Icons.home)),),
    body: Column(children: [searchBar(searchController: controller,query: widget.query),    
    Expanded(
        child: SingleChildScrollView(
          child: isData? SizedBox(
            height:MediaQuery.of(context).size.height,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing:10,mainAxisSpacing: 10,mainAxisExtent: 400,), 
            itemCount: Walls.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>Container(margin: EdgeInsets.all(4),width: 30,height:100 ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
            child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network(Walls[index].imgUrl,width: 30,height: 100,fit:BoxFit.cover,))
            ),
          )
          
          
            ):Lottie.asset("assets/loading.json")        ),
      )],));
  }
}