
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_scanner_v2/commons.dart';

import 'entry_and_exit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: LottieBuilder.asset(
                'assets/homeBg.json',
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const StopBore(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'entry',
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EntryAndExitPage(isInEntryMode: true),
                            ),
                          ),
                          icon: const Icon(
                            Icons.login_rounded,
                            // color: Colors.white,
                          ),
                          label: const Text('Entry'),
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50, child: VerticalDivider()),
                      Hero(
                        tag: 'exit',
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EntryAndExitPage(isInEntryMode: false),
                            ),
                          ),
                          icon: const Icon(
                            Icons.logout_rounded,
                            // color: Colors.white,
                          ),
                          label: const Text('Exit'),
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
