import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 75,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('Assets/images/addimage.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Tanvir islam',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('tanvir1664@gmail.com'),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              print("Update Profile page");
                            },
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Edit Profile'),
                                  Icon(Icons.edit_sharp, size: 15)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.black12,
                    child: Image.asset(
                      'Assets/images/ad.png',
                      fit: BoxFit.fill,
                    )),
                ListTile(
                  leading: const Icon(Icons.alarm),
                  title: const Text('Reminders'),
                  onTap: () {
                    print('Remainder here');
                  },
                ),
                const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
                ListTile(
                  leading: const Icon(Icons.note),
                  title: const Text('Share Note'),
                  onTap: () {
                    print('Share Note here');
                  },
                ),
                const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
                ListTile(
                  leading: const Icon(Icons.new_label),
                  title: const Text('Whats new'),
                  onTap: () {
                    print('Remainder here');
                  },
                ),
                const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
                ListTile(
                  leading: const Icon(Icons.backup),
                  title: const Text('Backup'),
                  onTap: () {
                    print('Share');
                  },
                ),
                const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
                ListTile(
                  leading: const Icon(Icons.restore),
                  title: const Text('Restore'),
                  onTap: () {
                    print('Share');
                  },
                ),
                const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Share'),
                  onTap: () {
                    print('Share');
                  },
                ),
                const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    print('Share');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
