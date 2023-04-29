import 'package:flutter/material.dart';

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

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
