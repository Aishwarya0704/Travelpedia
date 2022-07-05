import 'package:flutter/material.dart';
import 'package:travelapp/DetailPage.dart';
import 'package:travelapp/allfamousplaces.dart';
import 'package:travelapp/allseasons.dart';
import 'allmoods.dart';
import 'drawer.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textfield_search/textfield_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchcontroller = new TextEditingController();
  List suggestionlist = [];

  bool Is_show_search = false;
  String PlaceName = "";
  String PlaceImage = "";
  String PlaceDesc = "";
  List aff_links = [];

  // Map collection = {
  //   "Agra": {
  //     "Places": [
  //       {
  //         "ran": "chapli"
  //       }
  //     ],
  //     "random": "pgl"
  //   },
  //   "Ahmedabad": {
  //     "Places": []
  //   }
  // };

  Future<void> Test() async {
    await FirebaseFirestore.instance
        .collection("Places")
        .where("City", isEqualTo: "Ahmedabad")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        //print(element.get("Places")[2]["PlaceName"]);
        //print(element.get("Places").length);
        var variable = element.get("Places");
        int i;
        for (i = 0; i < variable.length; i++) {
          print(element.get("Places")[i]["PlaceDesc"]);
        }
      });
    }).catchError((e) {
      print(e);
    });
  }

  // void Test(){
  //   // for(int i =0;i<collection.length;i++){
  //   //   print(collection.)
  //   // }
  //   collection.forEach((key, value) {
  //
  //     print(value["Places"]);
  //   });
  //   // print(collection["Agra"]["Places"][0]["ran"]);
  //   // print(collection["Ahmedabad"]["Places"]);
  // }

  var moodlist = [
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

  var seasonlist = [
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

  var famousplaces = [
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

  var placelist = [];
  List Placename = [];

// Future<void> getDataFromSite() async {
//   var link = await http.get(
//       Uri.parse("https://www.tourmyindia.com/blog/best-places-visit-agra/"));
//
//   var htmldata = parse(link.body);
//   int i = 1;
//   for (i = 1; i <= 15; i++) {
//     placelist.add({
//       "PlaceName": htmldata
//           .getElementsByClassName("jammu-kashmir-attraction-second-box")[i]
//           .getElementsByTagName("h3")[0]
//           .text,
//       "PlaceImage": htmldata
//           .getElementsByClassName("jammu-kashmir-attraction-second-box")[i]
//           .getElementsByTagName("img")[0]
//           .attributes["src"],
//       "PlaceDesc": htmldata
//           .getElementsByClassName("jammu-kashmir-attraction-second-box")[i]
//           .children[2]
//           .text,
//       "Mood": "Tourism",
//       "Season": "",
//       "Lat": "",
//       "Long": "",
//       "City": "Agra"
//     });
//     String name = htmldata
//         .getElementsByClassName("jammu-kashmir-attraction-second-box")[i]
//         .getElementsByTagName("h3")[0]
//         .text
//         .toLowerCase();
//     String placename = name[0].toUpperCase() + name.substring(1, name.length);
//
//     Placename.add(placename.trim());
//     //print(placelist);
//   }
//   setData();
// }

  Future<void> getDataFromSite() async {
    var response = await http.get(Uri.parse(
        "https://www.fabhotels.com/blog/tourist-places-in-ahmedabad/"));

    var htmldata = parse(response.body);
    int i;
    int indexofimg = 6177;
    for (i = 0; i <= 12; i++) {
      // print(htmldata.getElementsByClassName("entry-content")[0].getElementsByTagName("h3")[i].text);
      // print(htmldata.getElementsByClassName("wp-image-${indexofimg}")[0].attributes["src"]);
      // print(htmldata.getElementById("attachment_${indexofimg}")!.nextElementSibling!.text);
      // print('++++++++++++++++++++++++++++++');
      placelist.add({
        "PlaceName": htmldata
            .getElementsByClassName("entry-content")[0]
            .getElementsByTagName("h3")[i]
            .text
            .toString()
            .substring(3)
            .split(",")[0],
        "PlaceImage": htmldata
            .getElementsByClassName("wp-image-$indexofimg")[0]
            .attributes["src"]
            .toString(),
        "PlaceDesc": htmldata
            .getElementById("attachment_$indexofimg")!
            .nextElementSibling!
            .text
            .toString(),
        "Mood": "Tourism",
        "Season": "All Seasons",
        "Lat": "",
        "Long": "",
        "City": "Ahmedabad"
      });
      Placename.add(htmldata
          .getElementsByClassName("entry-content")[0]
          .getElementsByTagName("h3")[i]
          .text
          .toString()
          .substring(3)
          .split(",")[0]);
      indexofimg += 1;
    }
    int j;
    int indexofimgs = 7258;
    for (j = 13; j <= 17; j++) {
      if (htmldata
              .getElementsByClassName("entry-content")[0]
              .getElementsByTagName("h3")[j]
              .text ==
          "18. Jhulta Minar, Ahmedabad") {
        placelist.add({
          "PlaceName": htmldata
              .getElementsByClassName("entry-content")[0]
              .getElementsByTagName("h3")[j]
              .text
              .toString()
              .substring(3)
              .split(",")[0],
          "PlaceImage": "",
          "PlaceDesc": "",
          "Mood": "Tourism",
          "Seasons": "All Seasons",
          "Lat": "",
          "Long": "",
          "City": "Ahmedabad"
        });
      } else {
        placelist.add({
          "PlaceName": htmldata
              .getElementsByClassName("entry-content")[0]
              .getElementsByTagName("h3")[j]
              .text
              .toString()
              .substring(3)
              .split(",")[0],
          "PlaceImage": htmldata
              .getElementsByClassName("wp-image-$indexofimgs")[0]
              .attributes["src"]
              .toString(),
          "PlaceDesc": htmldata
              .getElementById("attachment_$indexofimgs")!
              .nextElementSibling!
              .text
              .toString(),
          "Mood": "Tourism",
          "Seasons": "All Seasons",
          "Lat": "",
          "Long": "",
          "City": "Ahmedabad"
        });
      }
      // print(htmldata.getElementsByClassName("entry-content")[0].getElementsByTagName("h3")[j].text);
      // print(htmldata.getElementsByClassName("wp-image-${indexofimgs}")[0].attributes["src"]);
      // print(htmldata.getElementById("attachment_${indexofimgs}")!.nextElementSibling!.text);
      // print('++++++++++++++++++++++++++++++');
      Placename.add(htmldata
          .getElementsByClassName("entry-content")[0]
          .getElementsByTagName("h3")[j]
          .text
          .toString()
          .substring(3)
          .split(",")[0]);
      indexofimgs += 1;
    }
    int k;
    int indexofimgss = 6190;
    for (k = 18; k <= 21; k++) {
      // print(htmldata.getElementsByClassName("entry-content")[0].getElementsByTagName("h3")[k].text);
      // print(htmldata.getElementsByClassName("wp-image-${indexofimgss}")[0].attributes["src"]);
      // print(htmldata.getElementById("attachment_${indexofimgss}")!.nextElementSibling!.text);
      // print('++++++++++++++++++++++++++++++');
      placelist.add({
        "PlaceName": htmldata
            .getElementsByClassName("entry-content")[0]
            .getElementsByTagName("h3")[k]
            .text
            .toString()
            .substring(3)
            .split(",")[0],
        "PlaceImage": htmldata
            .getElementsByClassName("wp-image-$indexofimgss")[0]
            .attributes["src"]
            .toString(),
        "PlaceDesc": htmldata
            .getElementById("attachment_$indexofimgss")!
            .nextElementSibling!
            .text
            .toString(),
        "Mood": "Tourism",
        "Season": "All Seasons",
        "Lat": "",
        "Long": "",
        "City": "Ahmedabad"
      });
      Placename.add(htmldata
          .getElementsByClassName("entry-content")[0]
          .getElementsByTagName("h3")[k]
          .text
          .toString()
          .substring(3)
          .split(",")[0]);
      indexofimgss += 1;
    }

    // print(htmldata.getElementsByClassName("entry-content")[0].getElementsByTagName("h3")[0].text);
    // print(htmldata.getElementsByClassName("entry-content")[0].getElementsByTagName("img")[0].attributes["src"]);
    // print(htmldata.getElementsByClassName("entry-content")[0].getElementsByTagName("p")[10].text);
    // #post-6176 > div > div > div > p:nth-child(7)
    setData();
  }

  Future<void> setData() async {
    FirebaseFirestore.instance.collection("Places").doc("Ahmedabad").update({
      "Placenames": Placename,
      //"City" : "Agra",
      //"Country" : "Uttar Pradesh",
      // "Hotels" : [],
      "Places": placelist,
      // "Moods" : ["Adventure","Excitement","Peaceful","Horror","Joy","Depressed","Tourism"] ,
      // "Seasons" : ["Winter","Summer","Autumn","Spring","Monsoon"],
    }).then((value) {
      print("data added");
    });

    FirebaseFirestore.instance
        .collection("SuggestionList")
        .doc("PlacesName")
        .update({"PlaceName": FieldValue.arrayUnion(Placename)}).then(
            (value) => print("Updated"));
  }

  Future<void> getPlace() async {
    //print(destination.text.toString());
    await FirebaseFirestore.instance
        .collection("Places")
        .where("Placenames", arrayContainsAny: [
          (searchcontroller.text),
        ])
        .get()
        .then((value) {
          value.docs.forEach((element) {
            List places = element.get("Places");
            aff_links = element.get("Affiliate_links");
            print(places.length);
            for (int j = 0; j < places.length; j++) {
              if (places[j]["PlaceName"].toString().trim().toLowerCase() ==
                  searchcontroller.text.toLowerCase()) {
                setState(() {
                  PlaceName = places[j]["PlaceName"];
                  PlaceImage = places[j]["PlaceImage"];
                  PlaceDesc = places[j]["PlaceDesc"];
                  Is_show_search = true;
                });
              } else {}
            }
            // if(element.get("PlaceName")=="Taj mahal"){
            //   print(element);
            // }
          });
        })
        .catchError((e) {
          print(e);
        });
  }

  Future<void> GetSuggestionList() async {
    FirebaseFirestore.instance
        .collection("SuggestionList")
        .doc("PlacesName")
        .get()
        .then((value) {
      setState(() {
        suggestionlist = value.get("PlaceName");
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      GetSuggestionList();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF035397),
        title: const Text(
          "Travelpedia",
          textScaleFactor: 1.2,
          style: TextStyle(
            fontFamily: "Pacifico-Regular",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFieldSearch(
                label: "Search",
                controller: searchcontroller,
                initialList: suggestionlist,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.4),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Search Destination",
                    hintStyle: TextStyle(
                      color: Colors.grey[700],
                    ),
                    suffixIcon: Is_show_search
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                Is_show_search = false;
                              });
                            },
                            icon: const Icon(Icons.cancel))
                        : IconButton(
                            onPressed: () {
                              getPlace();
                            },
                            icon: const Icon(Icons.search),
                          )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Mood",
                    textScaleFactor: 1.4,
                    style:
                        TextStyle(fontFamily: "Pacifico-Regular", fontSize: 17),
                  ),
                ),
              ),
              SizedBox(
                height: 170,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: moodlist.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllMoods(
                                            MoodTitle: moodlist[index]
                                                ["Title"])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  //elevation: 10,
                                  borderRadius: BorderRadius.circular(20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      //color: Colors.grey.withOpacity(0.2),
                                      height: 130,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              "${moodlist[index]["Image"]}",
                                              height: 110,
                                              width: double.infinity,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${moodlist[index]["Title"]}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Season",
                    textScaleFactor: 1.4,
                    style:
                        TextStyle(fontFamily: "Pacifico-Regular", fontSize: 17),
                  ),
                ),
              ),
              SizedBox(
                height: 170,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: seasonlist.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllSeasons(
                                            seasonTitle: seasonlist[index]
                                                ["Title"])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  //elevation: 10,
                                  borderRadius: BorderRadius.circular(20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      //color: Colors.grey.withOpacity(0.2),
                                      height: 130,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              "${seasonlist[index]["Image"]}",
                                              height: 110,
                                              width: double.infinity,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${seasonlist[index]["Title"]}",
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
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Famous Places",
                    textScaleFactor: 1.4,
                    style:
                        TextStyle(fontFamily: "Pacifico-Regular", fontSize: 17),
                  ),
                  trailing: GestureDetector(
                      onTap: () {
                        //Test();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllFamous()));
                      },
                      child: const Chip(
                        label: Text("Show All", style: TextStyle(fontSize: 13)),
                        padding: EdgeInsets.zero,
                      )),
                ),
              ),
              ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: famousplaces.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                height: 170,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                          "${famousplaces[index]["Image"]}",
                                          height: 140,
                                          width: double.infinity,
                                          fit: BoxFit.fitWidth),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${famousplaces[index]["Title"]}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    );
                  }),
            ]),
            Is_show_search
                ? Positioned(
                    top: 80.0,
                    child: Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            Image: PlaceImage,
                                            Title: PlaceName,
                                            Desc: PlaceDesc,
                                            aff_link: aff_links,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Card(
                                elevation: 10,
                                //borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 250,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        PlaceImage,
                                        height: 200,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Text(
                                          PlaceName,
                                          style: const TextStyle(
                                            fontSize: 18,
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
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ]),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
