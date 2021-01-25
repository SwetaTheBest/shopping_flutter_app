import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("About Us"), centerTitle: true),
        body: aboutUs());
  }

  Container aboutUs() {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          _getCard(),
          _getAvatar(),
        ],
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      alignment: Alignment.center,
      margin: EdgeInsets.all(50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.5),
          color: Colors.blueGrey.shade200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              Text(
                "Sweta Jain",
                style: TextStyle(
                    fontSize: 20.9,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email),
              Text("sweta.jain@neosoftmail.com"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              Text("9*******68"),
            ],
          ),
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      // margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.blueGrey, width: 1.2),
          image: DecorationImage(
              image: NetworkImage(
                  "https://avatars3.githubusercontent.com/u/30392938?s=400&u=1ab105f18f0bf0b23c5a184cb3f29c278a3cb1af&v=4"),
              fit: BoxFit.cover)),
    );
  }
}
