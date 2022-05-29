import 'package:flutter/material.dart';
import 'package:nasa/components/main_text.dart';
import 'package:nasa/models/photos.dart';

class CardScreen extends StatelessWidget {
  final Photos card;

  const CardScreen({required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            'Traveling on curiosity',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 305.0,
                width: 305.0,
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(card.imgSrc!, fit: BoxFit.fitHeight,),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MainText(text: card.earthDate!)
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MainText(text: 'Rover: '),
                        MainText(text: card.rover!.name!),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      children: [
                        MainText(text: 'Status of rover: '),
                        MainText(text: card.rover!.status!),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      children: [
                        MainText(text: 'Launch date: '),
                        MainText(text: card.rover!.launchDate!),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      children: [
                        MainText(text: 'Landing date: '),
                        MainText(text: card.rover!.landingDate!),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      children: [
                        MainText(text: card.camera!.fullName!),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
