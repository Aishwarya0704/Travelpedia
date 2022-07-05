import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/loginpage.dart';
import 'package:travelapp/verfiyemail.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String val = "";
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool _isshowpass = true;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup() async {
    User? user = auth.currentUser;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailcontroller.text, password: _passwordcontroller.text)
          .then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const VerifyemailPage()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        setState(() {
          val = "password is too weak";
        });
      } else if (e.code == "email-already-in-use") {
        setState(() {
          val = "account already exists for the email";
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    //392
    double deviceHeight = MediaQuery.of(context).size.height;
    //802

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceHeight,
          width: deviceWidth,
          decoration: const BoxDecoration(
              color: Color(0xff7c94b6),
              image: DecorationImage(
                  image: AssetImage("assets/images/nature.jpg"),
                  //colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.modulate,),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      child: SingleChildScrollView(
                        child: Card(
                            color: Colors.black54,
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: TextFormField(
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                      controller: _emailcontroller,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white12,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        label: Text("Email",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 17.0, 20.0, 21.0),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "This field is required";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: TextFormField(
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                      controller: _passwordcontroller,
                                      obscureText: _isshowpass,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white12,
                                        suffixIcon: IconButton(
                                            color: Colors.white,
                                            icon: const Icon(
                                                Icons.remove_red_eye),
                                            onPressed: () {
                                              setState(() {
                                                if (_isshowpass) {
                                                  _isshowpass = false;
                                                } else {
                                                  _isshowpass = true;
                                                }
                                              });
                                            }),
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        label: const Text("Password",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                20.0, 17.0, 20.0, 21.0),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "This field is required";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  //Text(val),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width /
                                            1.3 +
                                        10,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                      ),
                                      onPressed: () {
                                        signup();
                                      },
                                      child: const Text("Sign Up",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Already have an account",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginPage()));
                                            },
                                            child: const Text("Login",
                                                style: TextStyle(
                                                    color: Colors.white)))
                                      ],
                                    ),
                                  ),
                                ])),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
