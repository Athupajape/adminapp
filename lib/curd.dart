import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class CurdMethods{

  Future<void> addData(feed) async{
    Firestore.instance.collection('Adfeeds').add({'feed':feed,'created':FieldValue.serverTimestamp()}).catchError((e){
      print(e);
    });
  }

  // getData() async{
  //  return await Firestore.instance.collection('Adfeeds').orderBy('feed',descending:true).getDocuments();
  // }

  deleteData(docId) async{
    return await Firestore.instance.collection('Adfeeds').document(docId).delete().catchError((e){print(e);});
  }

  updateData(selectedDoc,newValues){
    Firestore.instance.collection('Adfeeds').document(selectedDoc).updateData({'feed':newValues}).catchError((e){print(e);});
  }

}