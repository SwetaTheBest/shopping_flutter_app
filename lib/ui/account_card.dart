import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:assignment_dec_flutter_app/cloud/firebase_data.dart';

class AccountCard extends StatelessWidget {
  final QuerySnapshot snap;
  final int index;

  const AccountCard({Key key, this.snap, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var snapData = snap.docs[index].data();
    var snapDocId = snap.docs[index].id;
    TextEditingController nameInputController =
        TextEditingController(text: snapData["name"]);
    TextEditingController titleInputController =
        TextEditingController(text: snapData["title"]);
    TextEditingController descriptionInputController =
        TextEditingController(text: snapData["description"]);

    var timeToDate = DateTime.fromMillisecondsSinceEpoch(
        snapData["timestamp"].seconds * 1000);
    var formattedDate = new DateFormat("EEEE, MMM d, y").format(timeToDate);
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(snapData["title"]),
                  subtitle: Text(snapData["description"]),
                  leading: CircleAvatar(
                      radius: 36, child: Text(snapData["title"].toString()[0])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                      Text("By: ${snapData["name"]} "),
                      Spacer(),
                      Text(formattedDate),
                      Spacer(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showEditDialog(context, nameInputController,
                            titleInputController, descriptionInputController,
                            snapDocId);
                        print(snapDocId);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: () async {
                        var collectionRef =
                            FirebaseFirestore.instance.collection("board");
                        await collectionRef.doc(snapDocId).delete();
                        print(snapDocId);
                      },
                    ),
                    Spacer()
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  showEditDialog(BuildContext context,
      TextEditingController nameInputController,
      TextEditingController titleInputController,
      TextEditingController descriptionInputController,
      var snapDocId) async {
    await showDialog(
      context: context,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(10),
        content: Column(
          children: <Widget>[
            Text("Please update the data : "),
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
                decoration: InputDecoration(labelText: " title"),
                controller: titleInputController,
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: " description"),
                controller: descriptionInputController,
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
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          FlatButton(
            onPressed: () {
              if (titleInputController.text.isNotEmpty &&
                  nameInputController.text.isNotEmpty &&
                  descriptionInputController.text.isNotEmpty) {
                FirebaseFirestore.instance.collection("board")
                    .doc(snapDocId)
                    .update({
                  "name": nameInputController.text,
                  "title": titleInputController.text,
                  "description": descriptionInputController.text,
                  "timestamp": DateTime.now()
                }).then((response) {
                  Navigator.pop(context);
                }).catchError((error) => print(error));
              }
            },
            child: Text('Update'),
          )
        ],
      ),
    );
  }
}
