import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
 
  QuerySnapshot feeds;

  getData() async{
   return await Firestore.instance.collection('Adfeeds').orderBy('created',descending:true).getDocuments();
  }
  initTimer(){
 getData().then((results){
      setState((){
        feeds=results;
      });
    });

    Timer.periodic(Duration(minutes: 10),(Timer t){
      getData().then((results){
      setState((){
        feeds=results;
      });
    });
    
    });
    
  }

  @override
  void initState(){
    super.initState();

    initTimer();
  }

  void dispose(){
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feeds'),
        ),
      body: userlist(),
      floatingActionButton: FloatingActionButton(
            child: Text('Load More',textAlign: TextAlign.center,),
            onPressed:(){
              getData().then((results){
              setState((){
              feeds=results;
              });
              });
            }),
    );
  }

  Widget userlist(){
    if (feeds!=null){
      return ListView.builder(
        itemCount:feeds.documents.length ,
        itemBuilder: (context,index){
          return Card(
                      child: Container(
                          height: 50,
                          child: Row(
                            children: <Widget>[
                              Text(
                                feeds.documents[index].data['feed'],
                                textAlign: TextAlign.start,
                              ),
                            ],),),); 
        }
       
        );
        
    }
     else{
          return Text('Loading');
        }
  }
}



