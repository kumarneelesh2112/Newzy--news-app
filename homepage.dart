import "sectionnews.dart";
import 'package:flutter/material.dart';
import 'category.dart';
import 'aboutme.dart';

//import 'packages/category.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Widget CategoryTile(String url, String des) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: InkWell(
            onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SectionNews(des)))
                },
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    height: 240.0,
                    width: 360.0,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black38,
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      des,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  bool is_search_on = false;
  String search_string = "";
  List<myCategory> Category = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Category = getcategory();
  }

  search_pressed() {
    setState(() {
      if (is_search_on) {
        is_search_on = false;
      } else
        is_search_on = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (is_search_on == true) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            actions: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 5, 5, 5),
                  child: TextField(
                      textAlign: TextAlign.center,
                      onSubmitted: (value) {
                        setState(() {
                          search_string = value;
                          //is_search_on = false;
                          // value = "";
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SectionNews(search_string)));
                      },
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          labelText: "search..")),
                ),
              ),
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  search_pressed();
                },
                color: Colors.white,
                iconSize: 25,
              ),
            ],
          ),
          body: Container(
            child: Center(
              child: ListView.builder(
                itemCount: Category.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryTile(Category[index].url, Category[index].des);
                },
              ),
            ),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                search_pressed();
              },
              color: Colors.white,
              iconSize: 25,
            ),
          ],
          title: Text(
            "Newzy",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 30.0,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: ListView.builder(
              itemCount: Category.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryTile(Category[index].url, Category[index].des);
              },
            ),
          ),
        ),
        drawer: Drawer(
            child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Neelesh Kumar"),
            accountEmail: Text("kumarNeelesh2112@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "NK",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("favorites   ",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black)),
            leading: Icon(Icons.favorite, size: 25, color: Colors.red),
          ),
          ListTile(
            title: Text("setting   ",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black)),
            leading: Icon(Icons.settings, size: 25, color: Colors.red),
          ),
          ListTile(
            title: Text("logout   ",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black)),
            leading: Icon(Icons.home, size: 25, color: Colors.red),
          ),
          ListTile(
            title: Text("About Me   ",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => aboutme()));
            },
          )
        ])),
      );
    }
  }
}
