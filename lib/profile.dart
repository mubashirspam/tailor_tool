import 'dart:async';

import 'package:flutter/material.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          AppBar(
            title: Text(
              'Profile',
            ),
          ),
          InkWell(
              onTap: () {
                // navigateSecondPage(EditImagePage());
              },
              child: const DisplayImage()),
          SizedBox(height: 15),
          Text(
            "Mubashir Ahammed",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 5),
          Text(
            "mubashirspam@gmail.com",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 15),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
            child: SizedBox(
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Gender",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Text(": "),
                    SizedBox(
                      width: 50,
                      child: Text(
                        "Male",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
            child: SizedBox(
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Age",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Text(": "),
                    SizedBox(
                      width: 50,
                      child: Text(
                        "23",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
            child: SizedBox(
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Contact number",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Text(": "),
                    SizedBox(
                      width: 50,
                      child: Text(
                        "+919562229979",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                )),
          ),
          Spacer(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListTile(
                title: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info

  // Widget builds the About Me Section
  Widget buildAbout() => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tell Us About Yourself',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 350,
              height: 200,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "user.aboutMeDescriptio",
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                  ),
                                ))))),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ]))
        ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}

class DisplayImage extends StatelessWidget {
  // Constructor
  const DisplayImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = const Color.fromRGBO(64, 105, 225, 1);

    return Center(
        child: Stack(children: [
      buildImage(color),
      Positioned(
        child: buildEditIcon(color),
        right: 4,
        top: 10,
      )
    ]));
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
    return CircleAvatar(
      radius: 75,
      backgroundColor: color,
      child: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        radius: 70,
      ),
    );
  }

  // Builds Edit Icon on Profile Picture
  Widget buildEditIcon(Color color) => buildCircle(
      all: 8,
      child: Icon(
        Icons.edit,
        color: color,
        size: 20,
      ));

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
