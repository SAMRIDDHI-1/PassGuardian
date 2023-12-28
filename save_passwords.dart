import 'package:flutter/material.dart';
import 'package:passdiary/screens/login_screen.dart';
import 'package:passdiary/screens/saved_details.dart';

void main() => runApp(const SavePasswords());

class SavePasswords extends StatefulWidget {
  const SavePasswords({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _SavePasswordsState createState() => _SavePasswordsState();
}

class _SavePasswordsState extends State<SavePasswords> {
  final titleController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // disposing Controllers
  @override
  void dispose() {
    titleController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //AppBar
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
        // Log-Out Button
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets101.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 150),
            // 'Password Generator'
            const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text(
                'Save Password',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),

            const SizedBox(height: 25),

            // Title
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelText: "Title",
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 25),
            // Username
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelText: "Username",
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 25),
            // Password
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelText: "Password",
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 25),
            // ElevatedButton: Save
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SavedDetails()));
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
