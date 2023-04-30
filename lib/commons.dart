
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

// class StopBore extends StatefulWidget {
//   const StopBore({super.key});

//   @override
//   State<StopBore> createState() => _StopBoreState();
// }

// class _StopBoreState extends State<StopBore>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late List<String> pathList;
//   late int randInt;

//   @override
//   void initState() {
//     pathList = List.generate(3, (index) => 'assets/$index.json');
//     randInt = Random().nextInt(pathList.length);
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(minutes: 1),
//     )
//       ..forward()
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {

//             randInt = Random().nextInt(pathList.length);
//             // debugPrint('debug1: ' + randInt.toString());
//             controller
//               ..reset()
//               ..forward();
//           });
//         }
//       });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 500),
//       child: LottieBuilder.asset(
//         pathList[randInt],
//         key: ValueKey(randInt),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
