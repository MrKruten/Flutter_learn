import 'package:flutter/material.dart';
import 'package:nasa/components/main_text.dart';
import 'package:nasa/models/photos.dart';
import 'package:nasa/screens/card_screen.dart';

class CardPhoto extends StatelessWidget {
  final Photos card;

  const CardPhoto({required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardScreen(card: card)));
      },
        child: Container(
      width: 200.0,
      height: 230.0,
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 290,
            child: Image.network(card.imgSrc!, fit: BoxFit.fill),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Text(card.rover!.name!, style: TextStyle(fontSize: 20),),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20)),
              MainText(text: card.earthDate!),
            ],
          )
        ],
      ),
    ));
  }
}
