import 'package:flutter/material.dart';

class SpecialDiscount extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SpecialDiscount"), centerTitle: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
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
      ),
    );
  }


}
