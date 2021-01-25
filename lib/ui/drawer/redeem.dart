import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Redeem extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Redeem"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: redeemCode()),
        ));
  }

  Column redeemCode() {
    return Column(
      children: <Widget>[
        _getAvatar(),
        Text("Please enter your redeem code: "),
        Center(child: TextField()),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Fluttertoast.showToast(
                msg: "Sorry Invalid Coupon Code!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blueAccent,
                textColor: Colors.white,
                fontSize: 16.0);
          },
        )
      ],
    );
  }

  Container _getAvatar() {
    return Container(
      width: 230,
      height: 230,
      // margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.blue, width: 5),
          image: DecorationImage(
              image: NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.37aB7147ACNESYWPZk-ArwHaFj%26pid%3DApi&f=1"),
              fit: BoxFit.cover)),
    );
  }
}
