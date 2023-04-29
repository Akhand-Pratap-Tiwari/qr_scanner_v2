import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'commons.dart';
import 'database/database.dart';

class EntryAndExitPage extends StatefulWidget {
  final bool isInEntryMode;
  const EntryAndExitPage({
    super.key,
    required this.isInEntryMode,
  });

  @override
  State<EntryAndExitPage> createState() => _EntryAndExitPageState();
}

class _EntryAndExitPageState extends State<EntryAndExitPage> {
  bool isScanning = false;

  var mobileScannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    autoStart: false,
  )..stop();

  var gradient = const LinearGradient(
    colors: [Colors.black, Colors.black54],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  var widget1 = const Text(
    'Nothing Here',
    style: TextStyle(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          widget.isInEntryMode ? 'Entry Page' : 'On Exit',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: widget.isInEntryMode
            ? Colors.indigo
            : Colors.pinkAccent.withOpacity(0.8),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: LottieBuilder.asset(
              widget.isInEntryMode ? 'assets/bgNight.json' : 'assets/bgDay.json',
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: size.width - 16,
                  width: size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: MobileScanner(
                          controller: mobileScannerController,
                          onDetect: (capture) async {
                            final List<Barcode> barcodes = capture.barcodes;
                            for (final barcode in barcodes) {
                              User user = await MongoDatabase.fetch(
                                  regId: barcode.rawValue!);
                              setState(() {
                                mobileScannerController.stop();
                                isScanning = false;
                                if (barcode.rawValue == null) {
                                  widget1 = myText('Null Error. Try Again !');
                                  gradient = blackGradient;
                                } else if (user.regId == 'ResponseError') {
                                  user.displayData();
                                  widget1 = myText('Invalid Ticket');
                                  gradient = redGradient;
                                } else if (user.isCheckedIn.toLowerCase() ==
                                        'true' &&
                                    widget.isInEntryMode) {
                                  user.displayData();
                                  widget1 = myText(
                                      'Guest Already Checked In\nName: ${user.name}\nReg No.: ${user.regId}');
                                  gradient = yellowGradient;
                                } else if (user.isCheckedIn.toLowerCase() ==
                                        'true' &&
                                    !widget.isInEntryMode) {
                                  user.displayData();
                                  widget1 = myText(
                                      'Name: ${user.name}\nReg No.: ${user.regId}');
                                  gradient = greenGradient;
                                  MongoDatabase.update(
                                      regId: barcode.rawValue!,
                                      entryMode: widget.isInEntryMode);
                                } else {
                                  user.displayData();
                                  widget1 = myText(
                                      'Name: ${user.name}\nReg No.: ${user.regId}');
                                  gradient = greenGradient;
                                  MongoDatabase.update(
                                      regId: barcode.rawValue!,
                                      entryMode: widget.isInEntryMode);
                                }
                              });
                              debugPrint('debug: ${barcode.rawValue}');
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedContainer(
                  width: size.width,
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                      // color: Colors.purple,
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(16),
                  child: Center(child: widget1),
                ),
                isScanning
                    ? ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            isScanning = false;
                            mobileScannerController.stop();
                            widget1 = const Text(
                              'Nothing Here',
                              style: TextStyle(color: Colors.white),
                            );
                            gradient = blackGradient;
                          });
                        },
                        icon: const Icon(Icons.pages_rounded),
                        label: const Text('Stop'),
                      )
                    : Hero(
                      tag: widget.isInEntryMode ? 'entry' : 'exit',
                      child: ElevatedButton.icon(
                          onPressed: () {
                            mobileScannerController.start();
                            setState(() {
                              isScanning = true;
                              widget1 = const Text(
                                'Nothing Here',
                                style: TextStyle(color: Colors.white),
                              );
                              gradient = blackGradient;
                            });
                          },
                          icon: const Icon(Icons.document_scanner_outlined),
                          label: const Text('Scan'),
                        ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
