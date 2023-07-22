import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
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
                'assets/bg.json',
                fit: BoxFit.fitHeight,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                        tag: 'entry',
                        child: SizedBox(
                          height: 8 * 15,
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
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.indigo),
                            ),
                          ),
                        )),
                    const SizedBox(height: 8 * 15, child: VerticalDivider(width: 16)),
                    Hero(
                      tag: 'exit',
                      child: SizedBox(
                        height: 8 * 15,
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
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.pink),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const SupportDialog(),
            );
          },
          icon: const Icon(
            Icons.support_agent_rounded,
            color: Colors.black,
          ),
          label: const Text(
            'Support',
            style: TextStyle(color: Colors.black),
          ),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
          ),
        ),
      ),
    );
  }
}

class SupportDialog extends StatelessWidget {
  const SupportDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: Text('ClubT Scanner'),
                subtitle: Text('v3.2'),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Akhand P. Tiwari'),
              subtitle: const Text('+91 73090 40494'),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              trailing: CircleAvatar(
                child: IconButton(
                  onPressed: () => url_launcher.launchUrl(
                    Uri.parse('tel: +917309040494'),
                  ),
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Anand Lahoti'),
              subtitle: const Text('+91 98933 58161'),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              trailing: CircleAvatar(
                child: IconButton(
                  onPressed: () => url_launcher.launchUrl(
                    Uri.parse('tel: +919893358161'),
                  ),
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
