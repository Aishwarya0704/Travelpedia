import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/contactus.dart';
import 'package:travelapp/homepage.dart';
import 'package:travelapp/loginpage.dart';
import 'package:travelapp/profilepage.dart';
import 'package:travelapp/termcon.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF035397),
              ),
              margin: EdgeInsets.zero,
              accountName: Text(
                "${FirebaseAuth.instance.currentUser!.displayName == null ? "Welcome to Travelpedia" : FirebaseAuth.instance.currentUser!.displayName}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "${FirebaseAuth.instance.currentUser!.email}",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Color(0xFF035397)),
            title: const Text("Home", textScaleFactor: 1.2),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.profile_circled,
                color: Color(0xFF035397)),
            title: const Text("Profile", textScaleFactor: 1.2),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail, color: Color(0xFF035397)),
            title: const Text("Contact Us", textScaleFactor: 1.2),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactUs()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_center, color: Color(0xFF035397)),
            title: const Text("Terms & Conditions", textScaleFactor: 1.2),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TermAndCon()));
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.logout_outlined, color: Color(0xFF035397)),
            title: const Text("Logout", textScaleFactor: 1.2),
            onTap: () {
              auth.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          )
        ],
      ),
    );
  }
}
