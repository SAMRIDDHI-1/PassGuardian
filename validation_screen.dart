import 'package:flutter/material.dart';
import 'package:passdiary/screens/login_screen.dart';
import 'package:passdiary/screens/password_generator.dart';
import 'package:passdiary/screens/saved_details.dart';

class ValidationScreen extends StatefulWidget {
  const ValidationScreen({super.key});

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordLowerCase = false;
  bool _hasPasswordUpperCase = false;
  bool _hasPasswordSpecialCase = false;
  bool _hasPasswordGreekalphabet = false;

// Password Validator Function
  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final lowerCaseRegex = RegExp(r'[a-z]');
    final upperCaseRegex = RegExp(r'[A-Z]');
    final specialCaseRegex = RegExp(r'[@#%^&*(%).|_-`~<>?/*={}"$]');
    final greekLowerCaseRegex = RegExp(r'[αβθηζεδγικλμνξοπρστυφωψχ]');
    final greekUpperCaseRegex = RegExp(r'[ΩΨΦΣΠΞΛΘΔΓ]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;

      _hasPasswordLowerCase = false;
      if (lowerCaseRegex.hasMatch(password)) _hasPasswordLowerCase = true;

      _hasPasswordUpperCase = false;
      if (upperCaseRegex.hasMatch(password)) _hasPasswordUpperCase = true;

      _hasPasswordSpecialCase = false;
      if (specialCaseRegex.hasMatch(password)) _hasPasswordSpecialCase = true;

      _hasPasswordGreekalphabet = false;
      if (greekLowerCaseRegex.hasMatch(password) ||
          greekUpperCaseRegex.hasMatch(password))
        _hasPasswordGreekalphabet = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // background image
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/101.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        // AppBar
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
        // main body container
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),
                // Password Validator text
                const Text(
                  "Password Validator",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),

                const SizedBox(height: 10),
                // Text Field
                TextField(
                  onChanged: (password) => onPasswordChanged(password),
                  obscureText: !_isVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 30),
                // Contains at least 8 characters
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _isPasswordEightCharacters
                              ? Colors.green
                              : Colors.transparent,
                          border: _isPasswordEightCharacters
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Contains at least 8 Characters",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                // contains at least 1 lowerCase letter
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _hasPasswordLowerCase
                              ? Colors.green
                              : Colors.transparent,
                          border: _hasPasswordLowerCase
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Contains at least 1 LowerCase letter",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),

                const SizedBox(height: 10),
                // contains at least 1 UpperCase letter
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _hasPasswordUpperCase
                              ? Colors.green
                              : Colors.transparent,
                          border: _hasPasswordUpperCase
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Contains at least 1 UpperCase letter",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),

                const SizedBox(height: 10),
                // contains at least 1 number
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _hasPasswordOneNumber
                              ? Colors.green
                              : Colors.transparent,
                          border: _hasPasswordOneNumber
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Contains at least 1 Number",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),

                const SizedBox(height: 10),
                // contains at least 1 special Character
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _hasPasswordSpecialCase
                              ? Colors.green
                              : Colors.transparent,
                          border: _hasPasswordSpecialCase
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Contains at least 1 Special Character",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),

                const SizedBox(height: 10),
                // contains at least 1 Foreign language alphabet
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _hasPasswordGreekalphabet
                              ? Colors.green
                              : Colors.transparent,
                          border: _hasPasswordGreekalphabet
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Contains at least 1 Foreign Language Character",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),

                const SizedBox(height: 50),
                // Elevated Button 'Done'
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Random Password Generator button
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          // navigating to Password Generator
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PasswordGenerator()));
                          },
                          style: ElevatedButton.styleFrom(
                              // backgroundColor:                            const Color.fromARGB(255, 104, 209, 109),
                              ),
                          child: const Text(
                            "Password Generator",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),

                    // Save button
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SavedDetails()));
                          },
                          style: ElevatedButton.styleFrom(
                              //backgroundColor:                            const Color.fromARGB(255, 104, 209, 109),
                              ),
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
