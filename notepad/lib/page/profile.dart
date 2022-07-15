import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                leading: Icon(Icons.alarm),
                title: Text('Reminders'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('Remainder here');
                },
              ),
              const Divider(
                color: Colors.black26,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.folder),
                title: Text('Folders'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('Folder here');
                },
              ),
              const Divider(
                color: Colors.black26,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.note),
                title: Text('Share Note'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('Share Note here');
                },
              ),
              const Divider(
                color: Colors.black26,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.new_label),
                title: Text('Whats new'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('Remainder here');
                },
              ),
              const Divider(
                color: Colors.black26,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('Share');
                },
              ),
              const Divider(
                color: Colors.black26,
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
