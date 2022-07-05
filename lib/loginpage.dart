import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp/fgpwpage.dart';
import 'package:travelapp/signuppage.dart';
import 'homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String val = "";
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool _isshowpass = true;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  late String result = "";

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login() async {
    User? user = auth.currentUser;
    try {
      await auth
          .signInWithEmailAndPassword(
              email: _emailcontroller.text, password: _passwordcontroller.text)
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        setState(() {
          val = "no user found";
        });
      } else if (e.code == "wrong-password") {
        setState(() {
          val = "password is wrong";
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount? data = await googleSignIn.signIn() ?? null;
      print(data.toString());
      if (data != null) {
        print(data.displayName);
        print(data.email);
        print(data.id);
        print(data.photoUrl);
        setState(() {
          result = data.displayName! + ' - ' + data.id;
        });
      }
    } catch (error) {
      print(error);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
              image: DecorationImage(
                  image: AssetImage("assets/images/nature.jpg"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.3 - 30,
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
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "Login",
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
                                      obscureText: _isshowpass,
                                      controller: _passwordcontroller,
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
                                  //Text(val,style:const TextStyle(color: Colors.white),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 170),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ForgetpasswordPage()));
                                        },
                                        child: const Text(
                                          "Forgot Password",
                                          style: TextStyle(color: Colors.white),
                                        )),
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
                                        login();
                                      },
                                      child: const Text("Login ",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: MediaQuery.of(context).size.width /
                                              1.3 +
                                          10,
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            child:
                                                Icon(FontAwesomeIcons.google),
                                          ),
                                          TextButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                            ),
                                            onPressed: () {
                                              signInWithGoogle();
                                            },
                                            child: const Text(
                                                'Sign in with Google',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "Don't have an account ?",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignUpPage()));
                                          },
                                          child: const Text("Signup",
                                              style: TextStyle(
                                                  color: Colors.white)))
                                    ],
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
