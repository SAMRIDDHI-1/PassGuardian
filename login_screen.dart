import 'package:flutter/material.dart';
import 'package:passdiary/database/secure_storage.dart';
import 'package:passdiary/screens/password_generator.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = false;
  late String master;
  final _loginController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white, //const Color(0xff024576),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 10,
        // title: PassGuardian
        title: const Center(
          child: Text(
            'PassGuardian',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
          ),
        ),
      ),
      body: Container(
        // background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets101.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome
            const Padding(
              padding: EdgeInsets.only(top: 120, left: 18),
              child: Text(
                'Welcome!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),

            const SizedBox(height: 15),
            // Text Field
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _loginController,
                onChanged: (value) => master = value,
                obscureText: !_isVisible,
                decoration: InputDecoration(
                  labelText: 'Log in using your Master-Password',
                  labelStyle: const TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    // Visible Icon
                    icon: _isVisible
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

            const SizedBox(height: 10),
            // login Button
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: ElevatedButton(
                  onPressed: () async {
                    print(
                        'Typed TextField................................${master.toString()}');
                    //${SecureStorageClass();.readSecureData('pass').toString()}');
                    // comparing user enterred master with stored/registered password

                    print(
                        'readPassword..............................${SecureStorageClass().readSecureData('pass')}');
                    if (master ==
                        await SecureStorageClass().readSecureData('pass')) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PasswordGenerator()));
                    } else {
                      // snackBar
                      final message = SnackBar(
                        content: const Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "Incorrect Password",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        duration: const Duration(seconds: 2),
                        padding: const EdgeInsets.all(12),
                        shape: const StadiumBorder(side: BorderSide(width: 4)),
                        backgroundColor: const Color(0xff036596),
                        action:
                            SnackBarAction(label: 'Retry', onPressed: () {}),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(message);
                    }
                    print('User Successfully Logged in');
                    print(master);
                  },
                  child: const Text('Log in')),
            ),
          ],
        ),
      ),
    );
  }
}
