import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Faq extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Faq"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: faqCode()),
        ));
  }

  Column faqCode() {
    return Column(
      children: <Widget>[
        _getAvatar(),
        Text('What is carat?'),
        Text(
            'A Carat (Karat in USA & Germany) was originally a unit of mass (weight) based on the Carob seed or bean used by ancient merchants in the Middle East. The Carob seed is from the Carob or locust bean tree. The carat is still used as such for the weight of gem stones (1 carat is about 200 mg). For gold, it has come to be used for measuring the purity of gold where pure gold is defined as 24 carats.'),
      ],
    );
  }

  Container _getAvatar() {
    return Container(
      width: 250,
      height: 230,
      // margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.blue, width: 5),
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.kalyanjewellers.net/images/banners/faqs_banner.jpg"),
              fit: BoxFit.cover)),
    );
  }
}
