import 'package:flutter/material.dart';
import 'package:jobstate/app/extensions.dart';
import 'package:jobstate/games/models/gamapiresult.gen.dart';

class GameDetailView extends StatelessWidget {
  const GameDetailView(this.gameDetail, {Key? key}) : super(key: key);
  final GameDetail gameDetail;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FocusTraversalGroup(
            policy: OrderedTraversalPolicy(),
            child: Column(
              children: [
                FocusTraversalOrder(
                    order: const NumericFocusOrder(1.0),
                    child: Text(gameDetail.name!, style: context.h1)),
                FocusTraversalOrder(
                    order: const NumericFocusOrder(2.0),
                    child: Text(
                      gameDetail.descriptionRaw ?? 'Loading',
                      style: context.p,
                    ).frame),
                if (gameDetail.backgroundImage != null)
                  Image.network(gameDetail.backgroundImage!),
              ],
            )));
  }
}
