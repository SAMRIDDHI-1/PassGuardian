import 'package:flutter/material.dart';
import 'package:passdiary/screens/login_screen.dart';

class SavedDetails extends StatefulWidget {
  //const ({super.key});

  @override
  State<SavedDetails> createState() => _SavedDetailsState();
}

class _SavedDetailsState extends State<SavedDetails> {
  final titleController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late String newTitle;
  late String newUsername;
  late String newPassword;
  List<String> details = [];

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

      // floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue, //Color.fromARGB(255, 32, 146, 36),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),

                    // 'Password Generator'
                    const Padding(
                      padding: EdgeInsets.only(left: 30, top: 30, bottom: 10),
                      child: Text(
                        'Save Password',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),

                    const SizedBox(height: 25),
                    // Title
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: titleController,
                        onChanged: (value) {
                          newTitle = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          labelText: "Title",
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),

                    const SizedBox(height: 25),
                    // Username
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: usernameController,
                        onChanged: (value) {
                          newUsername = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          labelText: "Username",
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),

                    const SizedBox(height: 25),
                    // Password
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: passwordController,
                        onChanged: (value) {
                          newPassword = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ElevatedButton: Save
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Save Button
                        ElevatedButton(
                          onPressed: () {
                            //details.add(newTitle);
                            details.add(newUsername);
                            details.add(newPassword);

                            setState(() {
                              buildListView();
                            });

                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),

                        // Cancel Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),

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

      // main Body
      body: Container(
        // box decoration
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/101.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: buildListView(),
      ),
    );
  }

// List view builder function
  ListView buildListView() {
    int i = 1;
    return ListView.builder(
      itemBuilder: (context, index) {
        return (i % 2) == 0
            ? Card(
                child: ListTile(
                  title: Text(
                    details[i].toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Card(
                    child: ListTile(
                      title: Text(
                        details[i + 1].toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              )
            : Card(
                child: ListTile(
                  title: Text(
                    details[index].toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
      },
      itemCount: details.length,
    );
  }
}
