import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: .9);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: PageView(
        controller: pageController,
        children: List.generate(
          5,
          (index) => Container(
            margin: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: Colors.primaries[index % Colors.primaries.length]
                  .withOpacity(.2),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 50,
                  cornerSmoothing: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
