import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final String Image;
  final String Title;
  final String Desc;
  final List aff_link;

  DetailPage(
      {Key? key,
      required this.Image,
      required this.Title,
      required this.Desc,
      required this.aff_link})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List Affiliate_links = [
    {
      "img_link":
          "https://www.cidm.co.in/wp-content/uploads/2020/04/OYO_Rooms_Logo.jpg",
      "title": "oyo",
      "aff_link": "https://inr.deals/W8YHh9",
      "btn_text": "Book Now"
    },
    {
      "img_link":
          "https://www.themobileindian.com/wp-content/uploads/2021/06/makemytrip_425_735.jpg",
      "title": "MakeMyTrip",
      "aff_link": "https://inr.deals/gEoGyH",
      "btn_text": "Book Now"
    },
    {
      "img_link":
          "https://www.logolynx.com/images/logolynx/97/97dc0dbda8d31c08be3c17b17a6abedf.jpeg",
      "title": "Goibibo",
      "aff_link": "https://inr.deals/vadn7h",
      "btn_text": "Book Now"
    },
    {
      "img_link":
          "https://bsmedia.business-standard.com/_media/bs/img/article/2018-06/21/full/1529562641-2082.jpg",
      "title": "Cleartrip",
      "aff_link": "https://inr.deals/Kl4PA8",
      "btn_text": "Book Now"
    },
    {
      "img_link":
          "https://www.veronikasadventure.com/wp-content/uploads/2015/12/Booking.com-logo-large.jpg",
      "title": "Booking.com",
      "aff_link": "https://inr.deals/cqufB0",
      "btn_text": "Book Now"
    },
  ];

  Future<void> setLinks() async {
    await FirebaseFirestore.instance
        .collection("FamousPlaces")
        .doc("India")
        .set({"Affiliate_links": Affiliate_links}, SetOptions(merge: true));
  }

  @override
  void initState() {
    print(widget.aff_link);
    super.initState();
  }

  Future<void> getHotel() async {
    FirebaseFirestore.instance
        .collection("Places")
        .where("City", isEqualTo: "Agra")
        .get()
        .then((value) {
      value.docs.forEach((element) async {
        var link = element.get("Places")[0]["Hotel"];
        print(link);
      });
    });
  }

  // _launchURL() async {
  //   const url =
  //       "https://google.com";
  //   await canLaunchUrl(Uri.parse(url))? launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication):throw "Something went wrong";
  //   // if (await canLaunchUrl(Uri.parse(url))) {
  //   //   await launchUrl(Uri.parse(url));
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.Image,
                  height: MediaQuery.of(context).size.height / 1.5,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.4),
                  colorBlendMode: BlendMode.darken,
                )),
            DraggableScrollableSheet(
                initialChildSize: 0.5,
                maxChildSize: 0.8,
                minChildSize: 0.5,
                builder:
                    (BuildContext context, ScrollController scrollcontroller) {
                  return ListView(
                    physics: const ClampingScrollPhysics(),
                    controller: scrollcontroller,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Text(
                          widget.Title.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                          height: 500,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Text(widget.Desc,
                                      style: const TextStyle(fontSize: 15)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text("Available hotels and travels",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold)),
                                ),
                                ListView.builder(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: widget.aff_link.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          leading: Image.network(
                                            '${widget.aff_link[index]["img_link"]}',
                                            height: 100,
                                            width: 100,
                                          ),
                                          title: Text(
                                            '${widget.aff_link[index]["title"]}',
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          trailing: ElevatedButton(
                                            onPressed: () async {
                                              await launchUrl(
                                                  Uri.parse(
                                                      "${widget.aff_link[index]["aff_link"]}"),
                                                  mode: LaunchMode
                                                      .externalApplication);
                                            },
                                            child: Text(
                                                "${widget.aff_link[index]["btn_text"]}"),
                                          ),
                                        ),
                                      );
                                    })
                              ],
                            ),
                          )),
                    ],
                  );
                }),
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ))),
          ],
        ),
      ),
    );
  }
}
