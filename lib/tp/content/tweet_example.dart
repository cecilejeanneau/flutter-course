import 'package:flutter/material.dart';

class TweetExampleWidget extends StatelessWidget {
  const TweetExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipOval(
            child: Image.network(
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbhexunBo97hQ25UZOF8cuMYu2uSrlbMShRQ&s"
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("LilithKorn@NotNette",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 20)),
                    Text(
                      "50s",
                      style: TextStyle(color: Colors.grey
                      ))
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}