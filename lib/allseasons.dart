import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/DetailPage.dart';

class AllSeasons extends StatefulWidget {
  final seasonTitle;

  const AllSeasons({Key? key, required this.seasonTitle}) : super(key: key);

  @override
  State<AllSeasons> createState() => _AllSeasonsState();
}

class _AllSeasonsState extends State<AllSeasons> {
  String season = "";
  List seasonslist = [
    {
      "Title": "Winter",
      "Image":
          "https://images.unsplash.com/photo-1455156218388-5e61b526818b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fHdpbnRlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
    },
    {
      "Title": "Summer",
      "Image":
          "https://images.unsplash.com/photo-1515404929826-76fff9fef6fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
    },
    {
      "Title": "Autumn",
      "Image":
          "https://images.unsplash.com/flagged/photo-1552863047-1dd55fb6f8fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGF1dHVtbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
    },
    {
      "Title": "Spring",
      "Image":
          "https://images.unsplash.com/photo-1602938016996-a03a287ca891?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
    },
    {
      "Title": "Monsoon",
      "Image":
          "https://images.unsplash.com/uploads/14116603688211a68546c/30f8f30b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bW9uc29vbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
    }
  ];

  List<Color> colorlist = [
    Colors.blue,
    Colors.red,
    Colors.pink,
    Colors.indigo,
    Colors.green,
  ];

  bool isfiltered = false;
  List mainplaceslist = [];
  List filteredlist = [];
  List<String> citylist = ["Select City"];
  List<String> citylist2 = ["Select City"];
  String defaultcity = "Select City";
  List aff_link = [];

  Future<void> Filter() async {
    filteredlist.clear();
    int i = 0;
    for (i = 0; i < mainplaceslist.length; i++) {
      if (mainplaceslist[i]["City"].toString() == defaultcity.toString()) {
        filteredlist.add(mainplaceslist[i]);
      }
    }
    setState(() {
      isfiltered = true;
    });
  }

  Future<void> getData() async {
    await FirebaseFirestore.instance
        .collection("Places")
        .where("Seasons", arrayContainsAny: ["${widget.seasonTitle}"])
        .get()
        .then((value) {
          aff_link = value.docs[0].get("Affiliate_links");
          value.docs.forEach((element) {
            List places = element.get("Places");
            if (places.length > 0) {
              int i = 0;
              for (int i = 0; i < places.length; i++) {
                if (places[i]["Season"].toString() ==
                    widget.seasonTitle.toString()) {
                  mainplaceslist.add(places[i]);
                  citylist.add(places[i]["City"].toString());
                } else {
                  print("not match");
                }
              }
            }
          });
        })
        .catchError((e) {
          print(e.toString() + "-----------------");
        })
        .whenComplete(() {
          setState(() {
            citylist2 = citylist.toSet().toList();
          });
        });
  }

  Future<void> ShowAllSeasons() async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return Container(
          color: Colors.white,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: seasonslist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    season = seasonslist[index]["Title"];
                  });
                  getData();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    seasonslist[index]["Image"].toString()),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "${seasonslist[index]["Title"]}",
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          color: Colors.black.withOpacity(0.6),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // ShowAllSeasons();
      getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Seasons",
          textScaleFactor: 1.2,
          style: TextStyle(
            fontFamily: "Pacifico-Regular",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                  value: defaultcity,
                  hint: const Text(
                    "Country",
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  dropdownColor: Colors.grey,
                  elevation: 10,
                  isExpanded: true,
                  items: citylist2.map((String value) {
                    return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      defaultcity = value!;
                      Filter();
                    });
                  }),
            ),
            StreamBuilder(
                stream: Stream.fromIterable(
                    isfiltered ? mainplaceslist : filteredlist),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: !isfiltered
                          ? mainplaceslist.length
                          : filteredlist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            Image: !isfiltered
                                                ? mainplaceslist[index]
                                                    ["PlaceImage"]
                                                : filteredlist[index]
                                                    ["PlaceImage"],
                                            Title: !isfiltered
                                                ? mainplaceslist[index]
                                                    ["PlaceName"]
                                                : filteredlist[index]
                                                    ["PlaceName"],
                                            Desc: !isfiltered
                                                ? mainplaceslist[index]
                                                    ["PlaceDesc"]
                                                : filteredlist[index]
                                                    ["PlaceDesc"],
                                            aff_link: aff_link,
                                          )));
                            },
                            child: Material(
                              elevation: 20,
                              borderRadius: BorderRadius.circular(20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  height: 220,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                            "${!isfiltered ? mainplaceslist[index]["PlaceImage"] : filteredlist[index]["PlaceImage"]}",
                                            height: 190,
                                            width: double.infinity,
                                            fit: BoxFit.fitWidth),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "${!isfiltered ? mainplaceslist[index]["PlaceName"] : filteredlist[index]["PlaceName"]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                })
          ],
        ),
      ),
    );
  }
}
