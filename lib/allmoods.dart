import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'DetailPage.dart';

class AllMoods extends StatefulWidget {
  final MoodTitle;

  AllMoods({Key? key, required this.MoodTitle}) : super(key: key);

  @override
  State<AllMoods> createState() => _AllMoodsState();
}

class _AllMoodsState extends State<AllMoods> {
  String mood = "";
  List moodslist = [
    {
      "Title": "Adventure",
      "Image":
          "https://images.unsplash.com/photo-1542893849-b14a2c62aacb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80",
    },
    {
      "Title": "Excitement",
      "Image":
          "https://images.unsplash.com/photo-1496372412473-e8548ffd82bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1314&q=80",
    },
    {
      "Title": "Peaceful",
      "Image":
          "https://images.unsplash.com/photo-1446757981584-845b14aa7dd0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    },
    {
      "Title": "Horror",
      "Image":
          "https://images.unsplash.com/photo-1503925802536-c9451dcd87b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGhvcnJvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    },
    {
      "Title": "Joy",
      "Image":
          "https://images.unsplash.com/photo-1530789253388-582c481c54b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    },
    {
      "Title": "Depressed",
      "Image":
          "https://images.unsplash.com/photo-1595433306946-233f47e4af3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    },
    {
      "Title": "Tourism",
      "Image":
          "https://images.unsplash.com/photo-1517427677506-ade074eb1432?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    },
  ];

  List<Color> colorlist = [
    Colors.red,
    Colors.blue,
    Colors.indigo,
    Colors.green,
    Colors.yellow
  ];

  bool isfilltered = false;
  List mainPlacesList = [];
  List filteredlist = [];
  List<String> citylist = ["Select City"];
  List<String> citylist2 = ["Select City"];
  String defaultcity = "Select City";
  List aff_link = [];

  Future<void> Filter() async {
    filteredlist.clear();
    int i = 0;
    for (i = 0; i < mainPlacesList.length; i++) {
      if (mainPlacesList[i]["City"].toString() == defaultcity.toString()) {
        filteredlist.add(mainPlacesList[i]);
      }
    }
    setState(() {
      isfilltered = true;
    });
  }

  Future<void> getData() async {
    await FirebaseFirestore.instance
        .collection("Places")
        .where("Moods", arrayContainsAny: [
          "${widget.MoodTitle}",
        ])
        .get()
        .then((value) {
          aff_link = value.docs[0].get("Affiliate_links");
          value.docs.forEach((element) {
            List places = element.get("Places");
            if (places.length > 0) {
              int i = 0;
              for (i = 0; i < places.length; i++) {
                if (places[i]["Mood"].toString() ==
                    widget.MoodTitle.toString()) {
                  mainPlacesList.add(places[i]);
                  citylist.add(places[i]["City"].toString());
                } else {
                  print("Not match");
                }
              }
            }
          });
        })
        .catchError((e) {
          print(e.toString() + "____________++++++++++++");
        })
        .whenComplete(() {
          setState(() {
            citylist2 = citylist.toSet().toList();
          });
        });
  }

  Future<void> ShowAllMoods() async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return Container(
          color: Colors.white,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: moodslist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    mood = moodslist[index]["Title"];
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
                                    "${moodslist[index]["Image"].toString()}"),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "${moodslist[index]["Title"]}",
                              style: TextStyle(
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
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ShowAllMoods();
    // });
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Moods",
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
                    isfilltered ? mainPlacesList : filteredlist),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: !isfilltered
                          ? mainPlacesList.length
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
                                            Image: !isfilltered
                                                ? mainPlacesList[index]
                                                    ["PlaceImage"]
                                                : filteredlist[index]
                                                    ["PlaceImage"],
                                            Title: !isfilltered
                                                ? mainPlacesList[index]
                                                    ["PlaceName"]
                                                : filteredlist[index]
                                                    ["PlaceName"],
                                            Desc: !isfilltered
                                                ? mainPlacesList[index]
                                                    ["PlaceDesc"]
                                                : filteredlist[index]
                                                    ["PlaceDesc"],
                                            aff_link: aff_link,
                                          )));
                            },
                            child: Material(
                              elevation: 20,
                              borderRadius: BorderRadius.circular(20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                    height: 220,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            "${!isfilltered ? mainPlacesList[index]["PlaceImage"] : filteredlist[index]["PlaceImage"]}",
                                            height: 190,
                                            width: double.infinity,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "${!isfilltered ? mainPlacesList[index]["PlaceName"] : filteredlist[index]["PlaceName"]}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}
