import 'package:flutter/material.dart';

class ContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(
                width: 125,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK2nG24AYDm6FOEC7jIfgubO96GbRso2Xshu1f8abSYQ&s"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Lacrevette@Chocolat"),
                        Text("50s", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Répondre"),
              Text("Retweet"),
              Text("Favoris"),
            ],
          ),
        )
      ],
    );
  }
}
