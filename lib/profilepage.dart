import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? email = FirebaseAuth.instance.currentUser!.email;

  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _numbercontroller = TextEditingController();

  Future<void> GetProfileData() async {
    String? email = FirebaseAuth.instance.currentUser!.email;

    FirebaseFirestore.instance
        .collection("Profile")
        .doc(email)
        .get()
        .then((value) {
      setState(() {
        _usernamecontroller.text = value.get("Username");
        _emailcontroller.text = value.get("Email ");
        _numbercontroller.text = value.get("Phone_Number");
      });
    });
  }

  // Future <void> setProfile() async {
  //   String? email = FirebaseAuth.instance.currentUser!.email;
  //   FirebaseFirestore.instance.collection("Profile").doc(email).set(
  //     {
  //       "Username" : "",
  //       "Email " : email,
  //       "Phone_Number" : ""
  //     }
  //   ).then((value) {
  //     print("data added");
  //   }).catchError((e){
  //   });
  // }

  Future<void> CheckUsername() async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    FirebaseFirestore.instance
        .collection("Profile")
        .where("Username", isEqualTo: _usernamecontroller.text.toString())
        .get()
        .then((value) {
      if (!value.docs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("This Username is already taken")));
      } else {
        FirebaseFirestore.instance.collection("Profile").doc(email).update({
          "Username": _usernamecontroller.text.toString(),
        }).then((value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Username updated")));
        });
      }
    });
  }

  Future<void> CheckPhonenumber() async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    FirebaseFirestore.instance
        .collection("Profile")
        .where("Phone_Number", isEqualTo: _numbercontroller.text.toString())
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        FirebaseFirestore.instance.collection("Profile").doc(email).update({
          "Phone_Number": _numbercontroller.text.toString(),
        }).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Phone Number Updated")));
        });
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      GetProfileData();
      //setProfile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          textScaleFactor: 1.2,
          style: TextStyle(
            fontFamily: "Pacifico-Regular",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _usernamecontroller,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: const TextStyle(fontSize: 20),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1)),
                      prefixIcon: const Icon(
                        Icons.person,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          CheckUsername();
                        },
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _emailcontroller,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      hintText: "Email Address",
                      hintStyle: TextStyle(fontSize: 20),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 1)),
                      prefixIcon: Icon(
                        Icons.mail,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _numbercontroller,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      hintText: "Phone Number",
                      hintStyle: TextStyle(fontSize: 20),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 1)),
                      prefixIcon: Icon(
                        Icons.phone_android,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70.0),
        child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              CheckPhonenumber();
            }),
      ),
    );
  }
}
