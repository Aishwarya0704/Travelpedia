import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'DetailPage.dart';

class AllFamous extends StatefulWidget {
  const AllFamous({Key? key}) : super(key: key);

  @override
  State<AllFamous> createState() => _AllFamousState();
}

class _AllFamousState extends State<AllFamous> {
  List famousplaces = [
    {
      "Title": "Gunhill Road ,Mussoorie",
      "Image":
          "https://images.unsplash.com/photo-1547106365-bb4b17f50a15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
    },
    {
      "Title": "West Jaintia Hills ,Meghalaya",
      "Image":
          "https://images.unsplash.com/photo-1574286051774-2a26a826f17e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    },
    {
      "Title": "Jaisalmer Desert ,Rajasthan",
      "Image":
          "https://images.unsplash.com/photo-1633610430816-98ed35b65f07?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
    },
    {
      "Title": "Ooty , Tamil Nadu",
      "Image":
          "https://images.unsplash.com/photo-1589136777351-fdc9c9cab193?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
    },
    {
      "Title": "Bandipur ,Kerala",
      "Image":
          "https://images.unsplash.com/photo-1631607464513-46a874fa16e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1229&q=80"
    },
  ];

  List PlaceList = [];
  List aff_list = [];

  Future getDataFromSite() async {
    var link = await http.get(
        Uri.parse("https://www.touropia.com/tourist-attractions-in-india/"));
    var htmldata = parse(link.body);

    int i = 0;
    for (int i = 0; i <= 26; i++) {
      PlaceList.add({
        "PlaceName":
            htmldata.getElementsByClassName("toptitle")[i].text.substring(3),
        "PlaceImage":
            "https://${htmldata.getElementsByClassName("image_640")[i].getElementsByTagName("img")[0].attributes["data-lazy-src"].toString().substring(2)}",
        "PlacesDesc": htmldata
            .getElementsByClassName("image_640")[i]
            .nextElementSibling!
            .text
      });
    }
    setState(() {});
    //setData();
  }

  Future setData() async {
    FirebaseFirestore.instance
        .collection("FamousPlaces")
        .doc("India")
        .set({"Places": PlaceList}).then((value) => print("Data Added"));
  }

  Future getData() async {
    FirebaseFirestore.instance
        .collection("FamousPlaces")
        .doc("India")
        .get()
        .then((value) {
      setState(() {
        aff_list = value.get("Affiliate_links");
        PlaceList = value.get("Places");
      });
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Famous Places",
          textScaleFactor: 1.2,
          style: TextStyle(
            fontFamily: "Pacifico-Regular",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: PlaceList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                Desc: PlaceList[index]["PlacesDesc"],
                                Image: PlaceList[index]["PlaceImage"],
                                Title: PlaceList[index]["PlaceName"],
                                aff_link: aff_list,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 10,
                    //borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 270,
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            PlaceList[index]["PlaceImage"].toString(),
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "${PlaceList[index]["PlaceName"]}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
