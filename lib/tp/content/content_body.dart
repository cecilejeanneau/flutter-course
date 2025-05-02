import 'package:demo/tp/content/tweet_example.dart';
import 'package:demo/tp/content/tweet_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../entity/Tweet.dart';

class ContentBody extends StatefulWidget {
  const ContentBody({super.key});

  @override
  State<ContentBody> createState() => _ContentBodyState();
}

class _ContentBodyState extends State<ContentBody> {
  late Future<List<Tweet>> tweets = [] as Future<List<Tweet>>;

  Future<List<Tweet>> getTweets() async {
    var response = await http.get(Uri.parse(
      "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json"));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return List<Tweet>.from(jsonResponse.map((data) => Tweet.fromJson(data)));
    } else {
      throw Exception("Request failed with status: ${response.statusCode}.");
    }
  }

  @override
  void initState() {
    super.initState();
    tweets = getTweets();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TweetExampleWidget(),
          FutureBuilder<List<Tweet>>(
            future: tweets,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Erreur : ${snapshot.error}");
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text("Aucun tweet trouvé.");
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return TweetWidget(tweet: snapshot.data![index]);
                },
              );

              // if (snapshot.hasData && snapshot.data!.statusCode == 200 && snapshot.data?.body != null) {
              //   var jsonResponse = convert.jsonDecode(snapshot.data!.body);
              //
              //   tweets = List<Tweet>.from(jsonResponse.map((data) => Tweet.fromJson(data)));
              //
              //   return ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: tweets.length,
              //     itemBuilder: (context, index) {
              //       return TweetWidget(tweet: tweets[index]);
              //     },
              //   );
              // }
              // return ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: tweets.length,
              //   itemBuilder: (context, index) {
              //     return TweetWidget(tweet: tweets[index]);
              //   },
              // );
            }
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.comment_outlined)),
                IconButton(onPressed: null, icon: Icon(Icons.repeat_rounded)),
                IconButton(
                  onPressed: null, icon: Icon(Icons.star_purple500_rounded)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        tweets = getTweets();
                      });
                    },
                    icon: Icon(Icons.refresh_rounded, color: Colors.teal)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
