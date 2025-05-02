import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'Cat.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(title: "",),
    );
  }
}

class AppHomePage extends StatelessWidget {
  final String title;

  const AppHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: LoadCat()
    );
  }
}

class CatView extends StatelessWidget {
  final Cat whiskey;

  const CatView({super.key, required this.whiskey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(whiskey.urlImage ?? "", width: whiskey.width, height: whiskey.height, fit: BoxFit.cover)
      ],
    );
  }  
}

class LoadCat extends StatefulWidget {
  const LoadCat({super.key});

  @override
  State<LoadCat> createState() => _LoadCatState();
}

class _LoadCatState extends State<LoadCat> {

  Cat? whiskey;
  List<Cat>? cats = [];

  void getCat() async {

    var response = await http.get(Uri.parse("https://api.thecatapi.com/v1/images/search"));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        whiskey = Cat.fromJson(jsonResponse[0]);
      });
    } else {
      print("Request failed with status: ${response.statusCode}");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: getCat, child: Text("Get cat")),
        whiskey != null ? CatView(whiskey: whiskey!) : Container(),
        FutureBuilder<http.Response>(
            future: http.get(Uri.parse("https://api.thecatapi.com/v1/images/search?limit=20")),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.statusCode == 200 && snapshot.data?.body != null) {
                var jsonResponse = convert.jsonDecode(snapshot.data!.body);

                cats = List<Cat>.from(
                    jsonResponse.map<Cat>((data) => Cat.fromJson(data))
                );

                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cats?.length,
                      itemBuilder: (context, index) {
                        return ClipOval(child: CatView(whiskey: cats![index]));
                      }
                  ),
                );

                // cats = jsonResponse.map<Cat>((json) => Cat.fromJson(json)).toList();

                // return ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: jsonResponse.length,
                //   itemBuilder: (context, index) {
                //     return CatView(whiskey: Cat.fromJson(jsonResponse[index]));
                //   }
                // );
              }
              return CircularProgressIndicator();
            }
        )
      ],
    );
  }
}