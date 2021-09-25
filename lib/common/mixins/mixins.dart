import 'dart:math' as math;

mixin IllustrationsMixin {
  final assetPaths = <String>[
    'assets/images/bag.png',
    'assets/images/bottle.png',
    'assets/images/dumbell_hand.png',
    'assets/images/dumbell.png',
    'assets/images/hand.png',
    'assets/images/handgrip.png',
    'assets/images/kettlebell.png',
    'assets/images/punching_bag.png',
    'assets/images/trademill.png',
    'assets/images/skipping.png',
    'assets/images/weight_plate.png',
  ];

  String get getRandomIllustrationPath =>
      assetPaths[math.Random().nextInt(assetPaths.length)];
}
