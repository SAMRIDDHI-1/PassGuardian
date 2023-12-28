import 'package:flutter/material.dart';
//import 'package:passdiary/data/hive_database.dart';
import 'package:passdiary/database/secure_storage.dart';
import 'package:passdiary/screens/password_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isVisible1 = false;
  bool _isVisible2 = false;
  late String master;
  final registerController2 = TextEditingController();
  final registerController1 = TextEditingController();
  final tempSecureClass = SecureStorageClass();
  bool isRegistered = false;

  @override
  Widget build(BuildContext context) {
    // validation Function
    bool validation() {
      if (registerController1.text == registerController2.text &&
          registerController1.text.length == registerController2.text.length) {
        return true;
      } else {
        return false;
      }
    }

    return Container(
      // background image
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets101.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white, //const Color(0xff024576),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 10,
          // title: PassGuardian
          title: const Center(
            child: Text(
              'PassGuardian',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.black),
            ),
          ),
        ),

        // Main body Column
        body: SingleChildScrollView(
          //physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Registration Page
            children: [
              // Welcome
              const Padding(
                padding: EdgeInsets.only(top: 120, left: 14),
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),

              const SizedBox(height: 15),
              // Notice........................................................
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff4f6c8b),
                  border: Border.all(width: 3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "The Master Password cannot be retrieved if forgotten, so it's crucial to remember it.\nNote: Please be aware that once chosen, your Master Password cannot be changed, so make your selection thoughtfully.",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              // enter master key (1)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: registerController1,
                  obscureText: !_isVisible1,
                  decoration: InputDecoration(
                    labelText: 'Create your Master-Password',
                    labelStyle: const TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          _isVisible1 = !_isVisible1;
                        });
                      },
                      // Visible Icon
                      icon: _isVisible1
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),
              // Final password (2)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: registerController2,
                  onChanged: (value) => master = value,
                  obscureText: !_isVisible2,
                  decoration: InputDecoration(
                    labelText: 'Confirm your Master-Password',
                    labelStyle: const TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          _isVisible2 = !_isVisible2;
                        });
                      },
                      // Visible Icon
                      icon: _isVisible2
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 12),
              //Register Button
              Padding(
                padding: const EdgeInsets.only(left: 250),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    SecureStorageClass()
                        .writeSecureData('pass', registerController2.text);

                    print('User Successfully registerred');
                    print(master);

                    //if Successfully logged in-------------------------------------------------------------------------------------
                    var sharedPref = await SharedPreferences.getInstance();

                    if (validation()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordGenerator(),
                        ),
                      );

                      // Setting sharedPref to 'True'
                      sharedPref.setBool("Reg", true);
                    } else {
                      // snackBar
                      final message = SnackBar(
                        content: const Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "Passwords don't match",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        duration: const Duration(seconds: 2),
                        padding: const EdgeInsets.all(8),
                        shape: const StadiumBorder(side: BorderSide(width: 4)),
                        backgroundColor: const Color(0xff036596),
                        action:
                            SnackBarAction(label: 'Retry', onPressed: () {}),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(message);
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
