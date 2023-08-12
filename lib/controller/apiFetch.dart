import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixel_glide/models.dart/photo_model.dart';

// ignore: camel_case_types
class apiFetch{
  static Future<List<photoModel>> getTrendingimages()async{
  List<photoModel> trendingWalls = [];
  try{
  String api = "https://api.pexels.com/v1/curated?per_page=20";
    await http.get(Uri.parse(api),headers:{"Authorization":"6RMPw6R9x5AgLzjYh7IEc2JiqBz7uMN07HJCPwQlHFG4UzKFuRF7lflg"}).then((value){
      Map<String,dynamic> map = jsonDecode(value.body);
      List imgData = map['photos'];
      imgData.forEach((element) { 
        trendingWalls.add(photoModel.fromAPItoAPP(element));
      });
    });return trendingWalls;
    }catch(e){
      print("error occured in connecting to server trending images");
      return [];}
  }
  static Future<List<photoModel>> searchWallpaper(String query)async{
    List<photoModel> searchwalls=[];
    try{
     String api = "https://api.pexels.com/v1/search?query=$query&per_page=30";
    await http.get(Uri.parse(api),headers:{"Authorization":"6RMPw6R9x5AgLzjYh7IEc2JiqBz7uMN07HJCPwQlHFG4UzKFuRF7lflg"}).then((value){
       Map<String,dynamic> map = jsonDecode(value.body);
       List imgData = map['photos'];
      imgData.forEach((element) { 
        searchwalls.add(photoModel.fromAPItoAPP(element));
      });
    });
    print(searchwalls.length);
    return searchwalls;
    }catch(e){
      print("error occured in connecting to server search wallpapers");
      return [];}
  }
  }
