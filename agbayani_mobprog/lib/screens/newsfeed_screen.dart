import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Adrielle Agbayani',
          postContent: 'Test Post',
          numOfLikes: 300,
          numOfComments: 25,
          date: 'November 27',
          hasImage: true,
          profileImagePath: 'assets/images/image_1.jpg',
          imagePath: 'assets/images/post_1.jpg',
        ),

        NewsFeedCard(
          userName: 'Samantha Lukban',
          postContent: 'Hello World!',
          numOfLikes: 540,
          numOfComments: 48,
          date: 'November 27',
          hasImage: true,
        ),
      ],
    );
  }
}
