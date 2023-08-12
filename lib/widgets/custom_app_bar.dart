import 'package:flutter/material.dart';
class customAppBar extends StatelessWidget {
  String word1;
  String word2;
  customAppBar({required this.word1,required this.word2});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(text: "${this.word1} ",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),children: [
    TextSpan(text: "${this.word2}",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.black,blurRadius: 1)]))
    
  ]));
  }
}