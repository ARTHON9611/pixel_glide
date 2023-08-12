import 'package:flutter/material.dart';

class catWall extends StatelessWidget {
  String url;
  String query;
  catWall({super.key, required this.url,required this.query});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Stack(children: [ClipRRect(borderRadius: BorderRadius.circular(13),child: Image.network(width:100,height:50,fit:BoxFit.cover,url)),
      Container(width:100,height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Colors.black.withOpacity(0.2)),),
      Positioned(left: 12,bottom: 38,child: Text(query,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),))]),);
  }
}