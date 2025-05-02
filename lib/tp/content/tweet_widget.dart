import 'package:flutter/material.dart';
import '../entity/Tweet.dart';
import '../helper/format_duration.dart';

class TweetWidget extends StatelessWidget {
  final Tweet tweet;
  final int durationInSeconds = 1;

  const TweetWidget({super.key, required this.tweet});

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
                tweet.profile ?? ""
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
                    Text(
                        tweet.author ?? "LilithKorn@NotNette",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                            fontSize: 20)),
                    Text(
                        formatDuration(tweet.createdDate ?? durationInSeconds),
                        style: TextStyle(color: Colors.grey)
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    tweet.message ?? "POUET !"
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
