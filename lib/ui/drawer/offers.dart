import 'package:flutter/material.dart';

class Offers extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Offers"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: offerCode()),
        ));
  }

  Container offerCode() {
    return Container(
      width: 400,
      height: 400,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.blue, width: 5),
          image: DecorationImage(
              image: NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcouponwish.in%2Fwp-content%2Fuploads%2FPaytm-Gold-Offer-1024x358.png&f=1&nofb=1"),
              fit: BoxFit.fitWidth)),
    );
  }
}
