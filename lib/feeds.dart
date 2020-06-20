import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'curd.dart';

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  String text;
  CurdMethods crudObj = CurdMethods();

  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Data'),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter text'),
                  onChanged: (value) {
                    this.text = value;
                  },
                )
              ],
            ),
            actions: <Widget>[
              
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  crudObj.addData(this.text).then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
                child: Text('Add'),
              ),
               
            ],
          );
        });
  }

  Future<bool> updateDialog(BuildContext context,selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('update Data'),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter text'),
                  onChanged: (value) {
                    this.text = value;
                  },
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  crudObj.updateData(selectedDoc,this.text).then((result) {
                    // dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
                child: Text('Update'),
              ),
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Feeds"),
            content: Text('Added'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feeds'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                addDialog(context);
              })
        ],
      ),
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
                              FlatButton(
                                      onPressed: () {
                                        crudObj.deleteData(snapshot
                                            .data.documents[index].documentID);
                                      },
                                      child: Text('Delete')),
                              FlatButton(
                                      onPressed: () {
                                        updateDialog(context,snapshot.data.documents[index].documentID);
                                      },
                                      child: Text('Update Feed')),
                            ],
                          )),
                      );
                  });
            }
          }),
    );
  }
}
