import 'package:flutter/material.dart';
import 'package:jobstate/extensions.dart';
import 'package:jobstate/models/gamapiresult.dart';

class GameDetailView extends StatelessWidget {
  const GameDetailView(this.gameDetail, {Key? key}) : super(key: key);
  final GameDetail gameDetail;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Text(gameDetail.name!, style: context.h1),
        Text(
          gameDetail.descriptionRaw!,
          style: context.p,
        ).frame,
        Image.network(gameDetail.backgroundImage!)
      ],
    ));
  }
}
