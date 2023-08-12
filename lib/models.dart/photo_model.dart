class photoModel{

  String photoCredits;
  String imgUrl;

  photoModel({required this.photoCredits,required this.imgUrl});

  static photoModel fromAPItoAPP(Map<String,dynamic> map){
    
    return photoModel(photoCredits: map['photographer'], imgUrl: map['src']['portrait']);

  }





}