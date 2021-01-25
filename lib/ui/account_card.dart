import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountCard extends StatelessWidget {
  final QuerySnapshot snap;
  final int index;

  const AccountCard({Key key, this.snap, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var snapData = snap.docs[index].data();
    var snapDocId = snap.docs[index].id;

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
}
