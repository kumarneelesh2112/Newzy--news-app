import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class action_row extends StatefulWidget {
  String des = "", imgurl = "", content = "", url = "";
  action_row(this.des, this.content, this.imgurl, this.url);

  @override
  _action_rowState createState() => _action_rowState(des, content, imgurl, url);
}

class _action_rowState extends State<action_row> {
  String des = "", imgurl = "", content = "", url = "";
  _action_rowState(this.des, this.imgurl, this.content, this.url);
  bool liked = false;
  pressed() {
    setState(() {
      liked = !liked;
    });
  }

  _launchURLApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: IconButton(
          icon: Icon(Icons.thumb_up),
          tooltip: "Like",
          color: liked ? Colors.red : Colors.grey,
          onPressed: () => pressed(),
        ),
      ),
      Expanded(
        child: IconButton(
          icon: Icon(Icons.share),
          onPressed: () {},
          tooltip: "share",
        ),
      ),
      Expanded(
        child: IconButton(
          icon: Icon(Icons.add_to_home_screen),
          onPressed: () {
            _launchURLApp(url);
          },
        ),
      )
    ]);
  }
}

class SectionNews extends StatefulWidget {
  final String
      des; // i was struck here how to call stateful widget with parameter
  const SectionNews(this.des);

  @override
  _SectionNewsState createState() => _SectionNewsState(des);
}

class _SectionNewsState extends State<SectionNews> {
  String des;

  String url =
      "https://newsapi.org/v2/top-headlines?int=40&country=in&apiKey=fae8da09cb3c4efb88266b2bb554465a";

  _SectionNewsState(this.des);

  Widget customcard(String content, String descr, String imgurl, String url) {
    if (content == null) content = "Nothing to show";
    if (imgurl == null) {
      imgurl =
          "https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg";
    }
    return Center(
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(imgurl)),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    descr,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    content,
                    maxLines: 3,
                  ),
                ),
                action_row(descr, imgurl, content,
                    url), // face problem how to called full view and pass descr and imgurl int it
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getdata(String des) async {
    List<NewsTile> list = [];

    if (des == "Health & Fitness") {
      //debugPrint(des);
      url =
          "https://newsapi.org/v2/top-headlines?category=health&apiKey=fae8da09cb3c4efb88266b2bb554465a";
    }
    if (des == "Business") {
      url =
          "https://newsapi.org/v2/top-headlines?category=business&apiKey=fae8da09cb3c4efb88266b2bb554465a";
    }
    if (des == "Entertainment") {
      //debugPrint(des);
      url =
          "https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=fae8da09cb3c4efb88266b2bb554465a";
    }
    if (des == "Sports") {
      url =
          "https://newsapi.org/v2/top-headlines?category=sports&apiKey=fae8da09cb3c4efb88266b2bb554465a";
    }
    if (des == "Science & Tech") {
      url =
          "https://newsapi.org/v2/top-headlines?category=technology&apiKey=fae8da09cb3c4efb88266b2bb554465a";
    }
    if (des == "Headlines") {
      url = url;
    } else {
      url =
          "https://newsapi.org/v2/top-headlines?q=$des&apiKey=fae8da09cb3c4efb88266b2bb554465a";
    }
    var response = await http.get(url);
    //debugPrint(url);
    var jsondata = json.decode(response.body);

    if (jsondata['status'] == "ok") {
      for (var i in jsondata['articles']) {
        if (i['description'] != null && i['url'] != null) {
          NewsTile tile = new NewsTile(
              i['content'], i['description'], i['urlToImage'], i['url']);
          list.add(tile);
        }
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text(
            des,
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
        body: Center(
          child: FutureBuilder(
              future: getdata(des),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[CircularProgressIndicator()],
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return customcard(
                            snapshot.data[index].content,
                            snapshot.data[index].descr,
                            snapshot.data[index].imgurl,
                            snapshot.data[index].url);
                      });
                }
              }),
        ));
  }
}

class NewsTile {
  NewsTile(this.content, this.descr, this.imgurl, this.url);
  final String descr;
  final String content;
  final String url;
  final String imgurl;
}
