import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetpasswordPage extends StatefulWidget {
  const ForgetpasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetpasswordPage> createState() => _ForgetpasswordPageState();
}

class _ForgetpasswordPageState extends State<ForgetpasswordPage> {
  TextEditingController _emailcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> pswdrst({required String email}) async {
    User? user = auth.currentUser;
    try {
      await auth
          .sendPasswordResetEmail(email: email)
          .then((value) => const Text("email verified successfully"));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    //392
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceHeight,
          width: deviceWidth,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/nature.jpg"),
                  //colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.modulate,),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.7,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5, left: 11, right: 11, bottom: 5),
                      child: Card(
                        color: Colors.black54,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
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
                                      style: TextStyle(color: Colors.white)),
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
                            SizedBox(
                              height: 50,
                              width:
                                  MediaQuery.of(context).size.width / 1.3 + 10,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    pswdrst(email: _emailcontroller.text);
                                  }
                                },
                                child: const Text("Forgot Password",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
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
