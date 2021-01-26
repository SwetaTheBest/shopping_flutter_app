import 'package:assignment_dec_flutter_app/ui/account_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseData extends StatefulWidget {
  @override
  _FirebaseDataState createState() => _FirebaseDataState();
}

class _FirebaseDataState extends State<FirebaseData> {
  var firestoreDb = FirebaseFirestore.instance.collection('board').snapshots();
  TextEditingController nameInputController;
  TextEditingController titleInputController;
  TextEditingController descriptionInputController;
  TextEditingController imgInputController;

  @override
  void initState() {
    super.initState();
    nameInputController = TextEditingController();
    titleInputController = TextEditingController();
    descriptionInputController = TextEditingController();
    imgInputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products description"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showEditDialog(context, nameInputController, titleInputController,
                descriptionInputController, imgInputController);
          }),
      body: StreamBuilder(
        stream: firestoreDb,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, int index) {
                // return Text(snapshot.data.documents[index]['title']);
                return AccountCard(snap: snapshot.data, index: index);
              });
        },
      ),
    );
  }

  showEditDialog(
      BuildContext context,
      TextEditingController nameInputController,
      TextEditingController titleInputController,
      TextEditingController descriptionInputController,
      TextEditingController imgInputController) async {
    await showDialog(
      context: context,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(10),
        content: Column(
          children: <Widget>[
            Text("Please fill the form: "),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Product Name"),
                controller: nameInputController,
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Product title"),
                controller: titleInputController,
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Product description"),
                controller: descriptionInputController,
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Product image url"),
                controller: imgInputController,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              nameInputController.clear();
              titleInputController.clear();
              descriptionInputController.clear();
              imgInputController.clear();
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          FlatButton(
            onPressed: () {
              if (titleInputController.text.isNotEmpty &&
                  nameInputController.text.isNotEmpty &&
                  imgInputController.text.isNotEmpty &&
                  descriptionInputController.text.isNotEmpty) {
                FirebaseFirestore.instance.collection("board")
                    .add({
                  "name": nameInputController.text,
                  "title": titleInputController.text,
                  "description": descriptionInputController.text,
                  "img": imgInputController.text,
                  "timestamp": DateTime.now()
                }).then((response) {
                  Navigator.pop(context);
                  nameInputController.clear();
                  titleInputController.clear();
                  descriptionInputController.clear();
                }).catchError((error) => print(error));
              }
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
