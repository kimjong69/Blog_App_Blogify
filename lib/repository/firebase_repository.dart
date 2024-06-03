import 'package:blog_app/model/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BlogRepository{
  Future<List<BlogModel>> get()async{
  List<BlogModel> blogList=[];
  try{
    final blog=await FirebaseFirestore.instance.collection('blogs').get();
    blog.docs.forEach((element){
      return blogList.add(BlogModel.fromJson(element.data()));
    });
    return blogList;
  }on FirebaseException catch(e){
    if(kDebugMode){
      print('Failed with error ${e.code}:${e.message}');
    }
    return blogList;
  }catch(e){
    throw Exception(e.toString());
  }
}
}

