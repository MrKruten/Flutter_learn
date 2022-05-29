import 'package:flutter/material.dart';
import 'package:nasa/models/photos.dart';

import 'card_photo.dart';

class ListCards extends StatelessWidget {
  final List<Photos> list;
  const ListCards({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
        itemBuilder: (context, index){
          return CardPhoto(card: list[index]);
        }
    );
  }
}
