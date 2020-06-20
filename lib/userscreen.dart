import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection('Adfeeds').orderBy('feed',descending:true).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('No data');
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    // DocumentSnapshot ds = snapshot.data.documents[index];
                    return Card(
                      child: Container(
                          height: 50,
                          child: Row(
                            children: <Widget>[
                              Text(
                                snapshot.data.documents[index]['feed'],
                                textAlign: TextAlign.start,
                              ),
                              
                            ],
                          )),
                      );
                  });
            }
          }),

    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'curd.dart';


// class UserScreen extends StatefulWidget {
//   @override
//   _UserScreenState createState() => _UserScreenState();
// }

// class _UserScreenState extends State<UserScreen> {
//   CurdMethods crudObj = CurdMethods();
//   QuerySnapshot feeds;

//   @override
//   void initState(){
//     // const onesecond=const Duration(seconds:25),
//     // Timer.periodic(onesecond,(Timer t)=>)
//     crudObj.getData().then((results){
//       setState((){
//         feeds=results;
//       });
//     });
    
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: userlist(),
//     );
//   }

//   Widget userlist(){
//     if (feeds!=null){
//       return ListView.builder(
//         itemCount:feeds.documents.length ,
//         itemBuilder: (context,index){
//           return Card(
//                       child: Container(
//                           height: 50,
//                           child: Row(
//                             children: <Widget>[
//                               Text(
//                                 feeds.documents[index].data['feed'],
//                                 textAlign: TextAlign.start,
//                               ),
//                             ],),),); 
//         }
       
//         );
        
//     }
//      else{
//           return Text('Loading');
//         }
//   }
// }



// StreamBuilder(
//           stream: Firestore.instance.collection('Adfeeds').orderBy('feed',descending:true).snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return Text('No data');
//             } else {
//               return ListView.builder(
//                   itemCount: snapshot.data.documents.length,
//                   itemBuilder: (context, index) {
//                     // DocumentSnapshot ds = snapshot.data.documents[index];
//                     return Card(
//                       child: Container(
//                           height: 50,
//                           child: Row(
//                             children: <Widget>[
//                               Text(
//                                 snapshot.data.documents[index]['feed'],
//                                 textAlign: TextAlign.start,
//                               ),
                              
//                             ],
//                           )),
//                       );
//                   });
//             }
//           }),
