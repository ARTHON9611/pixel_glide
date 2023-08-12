import 'package:flutter/material.dart';
import 'package:pixel_glide/screens/search.dart';

class searchBar extends StatelessWidget {
  TextEditingController searchController;
  String query;
  searchBar({required this.searchController,required this.query});

  @override
  Widget build(BuildContext context) {
    return Container(
              //Search Wala Container
    
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(24)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>searchScreen(query: searchController.text)));}
                    ,
                    child: Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: searchController,
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>searchScreen(query: value)));
                        },
                        // (value) {
                        //   if ((searchController.text).replaceAll(" ", "") == "") {
                        //     print("Blank search");
                        //   } else {
                        //     onPress;
                            
                        //   }
                        // },
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Search Wallpapers"),
                      ),
                    ),
                  )
                ],
              ));
  }
}