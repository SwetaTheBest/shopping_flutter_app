import 'package:assignment_dec_flutter_app/ui/account_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  var firestoreDb = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
      ),
      body: StreamBuilder(
        stream: firestoreDb,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, int index) {
                return UserCard(snap: snapshot.data, index: index);
              });
        },
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final QuerySnapshot snap;
  final int index;

  const UserCard({Key key, this.snap, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var snapData = snap.docs[index].data();
    return Column(
      children: [
        Poster(
          poster: snapData["img"],
        ),
        Text(
          snapData["name"],
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.blueGrey),
        ),
        Text(
          snapData["contact"],
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.blueGrey.shade400),
        ),
        Text(
          snapData["address"],
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.blueGrey),
        ),
      ],
    );
  }
}

class ItemsList extends StatelessWidget {
  final List<String> posters;

  const ItemsList({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => SizedBox(
                    width: 8.0,
                  ),
              itemCount: posters.length,
              itemBuilder: (context, index) => Poster(
                    poster: posters[index],
                  )),
        ),
      ],
    );
  }
}

class Poster extends StatelessWidget {
  final String poster;

  const Poster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 160,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(poster), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
