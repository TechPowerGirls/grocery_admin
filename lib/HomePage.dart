import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Ref = Firestore.instance.collection("Category");
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),

      ),
      body: StreamBuilder(
        stream: Ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
                  return
                    Text(snapshot.data.documents[index].data.toString());
                });
          }
          else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
