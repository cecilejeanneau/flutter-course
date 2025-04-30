import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
      ),
      body: Column(
        children: [
          Text("Page1", style: TextStyle(fontSize: 56)),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => PageTwo()));
              Navigator.pushNamed(context, "/page-2", arguments: 456);
            },
            child: Text("Go to PAGE 2")
          )
        ]
      )
    );
  }
}