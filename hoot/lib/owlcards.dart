import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwlCard extends StatelessWidget {
  final String owl;
  final String owlName;
  final String owlBio;

  OwlCard(
      {Key key,
      @required this.owl,
      @required this.owlName,
      @required this.owlBio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(owlName),
          backgroundColor: Colors.lightGreen,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 15.0,
                  left: 15.0,
                  right: 15.0,
                ),
                child: Image.asset('assets/images/$owl.jpg'),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                child: Text(
                  owlName,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  owlBio,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
