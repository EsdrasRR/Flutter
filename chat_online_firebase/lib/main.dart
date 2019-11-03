import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {

  Firestore.instance.collection("mensagens").document().setData({"from":"Rafael", "texto":"Hello"});

  QuerySnapshot querySnapshot = await Firestore.instance.collection("mensagens").getDocuments();
  
  for(DocumentSnapshot doc in querySnapshot.documents){
    print(doc.documentID);
  }

  Firestore.instance.collection("mensagens").snapshots().listen((snapshot){
    for(DocumentSnapshot dpc in snapshot.documents){
      print(dpc.data);
    }
  });

  DocumentSnapshot snapshot = await Firestore.instance.collection("mensagens").document("vRPvLEXnTEVOIzh9StW5").get();
  print(snapshot.documentID);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
