import 'package:flutter/material.dart';

class SpecialDiscount extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("SpecialDiscount"), centerTitle: true),
        body: aboutUs());
  }

  Container aboutUs() {
    return Container(alignment: Alignment.center, child: _getAvatar());
  }

  Container _getAvatar() {
    return Container(
      width: 400,
      height: 400,
      // margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.blueGrey, width: 1.2),
          image: DecorationImage(
              image: NetworkImage(
                  "https://image.freepik.com/free-vector/special-discount-coupons_23-2147502065.jpg"),
              fit: BoxFit.cover)),
    );
  }
}
