import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? id;
  String? pass;

  // static const String univId = 'foundanand';
  // static const String univPass = '@Strae#@cet3';
  static const String univId = 'q';
  static const String univPass = 'q';

  var idController = TextEditingController();
  var passController = TextEditingController();
  var collectionController = TextEditingController();

  void _validator(BuildContext context) {
    var id = idController.text.trim();
    var pass = passController.text.trim();
    var collection = collectionController.text.trim();
    

    if (id == '' || pass == '' || pass != univPass || id != univId) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Oops!",
            style: TextStyle(color: Colors.red),
          ),
          content: const Text(
              "Looks like there is problem in email or password... \nRecheck the details you have entered."),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"))
          ],
        ),
      );
    } else {
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Login",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height / 1.5,
            child: Stack(
              children: [
                Container(
                  height: size.height / 1.5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(size.width / 2, 88),
                        bottomRight: Radius.elliptical(size.width / 2, 88)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: idController,
                        decoration: const InputDecoration(labelText: "Id"),
                        style: const TextStyle(color: Colors.white),
                      ),
                      TextField(
                        controller: passController,
                        decoration:
                            const InputDecoration(labelText: "Password"),
                        style: const TextStyle(color: Colors.white),
                      ),
                      TextField(
                        controller: collectionController,
                        decoration:
                            const InputDecoration(labelText: "Collection Name"),
                        style: const TextStyle(color: Colors.white),
                      ),
                      FloatingActionButton.extended(
                        onPressed: () => _validator(context),
                        icon: const Icon(Icons.login_rounded),
                        label: const Text("Login"),
                        backgroundColor: Colors.amber,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
