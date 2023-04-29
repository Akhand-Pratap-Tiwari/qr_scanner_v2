import 'package:flutter/material.dart';

import 'entry_and_exit.dart';
import 'exit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EntryAndExitPage(entryMode: true),
                      ),
                    ),
                    icon: const Icon(
                      Icons.login_rounded,
                      // color: Colors.white,
                    ),
                    label: const Text(
                      'Entry',
                      // style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                  ),
                  SizedBox(height: 50, child: VerticalDivider()),
                  FilledButton.icon(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EntryAndExitPage(entryMode: false),
                      ),
                    ),
                    icon: const Icon(
                      Icons.logout_rounded,
                      // color: Colors.white,
                    ),
                    label: const Text(
                      'Exit',
                      // style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
