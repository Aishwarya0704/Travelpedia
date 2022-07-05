import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/homepage.dart';

class VerifyemailPage extends StatefulWidget {
  const VerifyemailPage({Key? key}) : super(key: key);

  @override
  State<VerifyemailPage> createState() => _VerifyemailPageState();
}

class _VerifyemailPageState extends State<VerifyemailPage> {
  @override
  void initState() {
    checkEmail();
    super.initState();
  }

  Timer? timer;
  bool isShowLoading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> checkEmail() async {
    auth.currentUser!.sendEmailVerification();
    setState(() {
      isShowLoading = true;
    });
    timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      var user = FirebaseAuth.instance.currentUser;
      await user!.reload();
      if (user.emailVerified) {
        timer.cancel();
        setState(() {
          isShowLoading = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        return;
      }
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            CircularProgressIndicator(),
            Text("Please check your mail"),
          ],
        ),
      ),
    );
  }
}
