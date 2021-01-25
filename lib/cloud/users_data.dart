import 'package:assignment_dec_flutter_app/cloud/users.dart';
import 'package:assignment_dec_flutter_app/ui/account_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserData extends StatefulWidget {
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  var firestoreDb = FirebaseFirestore.instance.collection('users').snapshots();
  TextEditingController nameInputController;
  TextEditingController addressInputController;
  TextEditingController contactInputController;
  TextEditingController imgInputController;

  @override
  void initState() {
    super.initState();
    nameInputController = TextEditingController();
    addressInputController = TextEditingController();
    contactInputController = TextEditingController();
    imgInputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User's description"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showEditDialog(context, nameInputController, addressInputController,
                contactInputController, imgInputController);
          }),
      body: StreamBuilder(
        stream: firestoreDb,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, int index) {
                // return Text(snapshot.data.documents[index]['address']);
                return UserCard(snap: snapshot.data, index: index);
              });
        },
      ),
    );
  }

  showEditDialog(
    BuildContext context,
    TextEditingController nameInputController,
    TextEditingController addressInputController,
    TextEditingController contactInputController,
    TextEditingController imgInputController,
  ) async {
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
                decoration: InputDecoration(labelText: "Your Name"),
                controller: nameInputController,
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Your address"),
                controller: addressInputController,
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Your contact"),
                controller: contactInputController,
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Your image url"),
                controller: imgInputController,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              nameInputController.clear();
              addressInputController.clear();
              contactInputController.clear();

              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          FlatButton(
            onPressed: () {
              if (addressInputController.text.isNotEmpty &&
                  nameInputController.text.isNotEmpty &&
                  imgInputController.text.isNotEmpty &&
                  contactInputController.text.isNotEmpty) {
                FirebaseFirestore.instance.collection("users").add({
                  "name": nameInputController.text,
                  "address": addressInputController.text,
                  "contact": contactInputController.text,
                  "img": imgInputController.text
                }).then((response) {
                  print(response.id);
                  Navigator.pop(context);
                  nameInputController.clear();
                  addressInputController.clear();
                  contactInputController.clear();
                  imgInputController.clear();
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
