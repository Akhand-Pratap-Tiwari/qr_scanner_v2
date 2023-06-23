import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // const StopBore(),
                  LottieBuilder.asset('assets/home.json'),
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
                                MaterialStatePropertyAll(Colors.indigo),
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
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.pink),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkResponse(
                    // splashColor: Colors.red,
                    // radius: 300,
                    // borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      showAboutDialog(
                        applicationName: 'Club TT',
                        applicationVersion: 'v3.1',
                        applicationLegalese:
                            'This app is a property of VIT, Bhopal students. Commercial use without permission or reverse engineering is not permitted.',
                        context: context,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 8.0),
                            child: Text(
                              'Built By: ',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(height: 16),
                          ListTile(
                            title: Text('Akhand P. Tiwari'),
                            tileColor: Colors.black12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            trailing: IconButton(
                              onPressed: () => UrlLauncher.launchUrl(
                                Uri.parse('tel: +917309040494'),
                              ),
                              icon: Icon(
                                Icons.phone,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          ListTile(
                            title: Text('Anand Lahoti'),
                            tileColor: Colors.black12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ],
                      );
                    },
                    child: Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 30,
                    ),
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
