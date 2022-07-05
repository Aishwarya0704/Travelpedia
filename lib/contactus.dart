import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController _msgcontroller = TextEditingController();
  TextEditingController _subjectcontroller = TextEditingController();

  Future<void> ContactUs() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'contact.soearn@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': _subjectcontroller.text,
        'body': _msgcontroller.text
      }),
    );

    launchUrl(Uri.parse(emailLaunchUri.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact Us",
          textScaleFactor: 1.2,
          style: TextStyle(
            fontFamily: "Pacifico-Regular",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF035397),
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          "Hi there",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Icon(
                        Icons.waving_hand_sharp,
                        size: 30,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Need Help? Send mail to us for",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "any query",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: TextFormField(
                controller: _subjectcontroller,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  labelText: "Subject",
                  labelStyle: TextStyle(fontSize: 20, color: Color(0xFF035397)),
                  hintText: "Enter a subject here",
                  hintStyle: TextStyle(fontSize: 15, color: Color(0xFF035397)),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: TextFormField(
                minLines: 2,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                controller: _msgcontroller,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  labelText: "Message",
                  labelStyle: TextStyle(fontSize: 20, color: Color(0xFF035397)),
                  hintText: "Enter a message here",
                  hintStyle: TextStyle(fontSize: 15, color: Color(0xFF035397)),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF035397)),
              ),
              onPressed: () {
                ContactUs();
              },
              child: const Text("Send Message", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
