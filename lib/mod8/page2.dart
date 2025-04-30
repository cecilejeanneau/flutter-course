import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});


  @override
  Widget build(BuildContext context) {
    int? number = ModalRoute.of(context)!.settings.arguments as int?;

    return Scaffold(
        appBar: AppBar(
          title: Text('Page Two'),
        ),
        body: Column(
            children: [
              Text("Page2", style: TextStyle(fontSize: 56)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Go back to $number")
              )
            ]
        )
    );
  }
}