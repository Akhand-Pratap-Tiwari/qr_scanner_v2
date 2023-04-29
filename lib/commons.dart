import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

var contTxtStyle = const TextStyle(color: Colors.white);

var blackGradient = const LinearGradient(
  colors: [Colors.black, Colors.black54],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

var greenGradient = const LinearGradient(
  colors: [Colors.lightGreen, Colors.green],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

var redGradient = const LinearGradient(
  colors: [Colors.pinkAccent, Colors.red],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

var yellowGradient = const LinearGradient(
  colors: [Colors.amber, Colors.deepOrangeAccent],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

Text myText(String text) {
  return Text(
    text,
    style: contTxtStyle,
  );
}

class StopBore extends StatefulWidget {
  const StopBore({super.key});

  @override
  State<StopBore> createState() => _StopBoreState();
}

class _StopBoreState extends State<StopBore> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  int randInt = Random().nextInt(8);

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    )
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            randInt = Random().nextInt(8);
            debugPrint('debug22: ' + randInt.toString());
            controller
              ..reset()
              ..forward();
          });
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: LottieBuilder.asset(
        'assets/$randInt.json',
        key: ValueKey(randInt),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
