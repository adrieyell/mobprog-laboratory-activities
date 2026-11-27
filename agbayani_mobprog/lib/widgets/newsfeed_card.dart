
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final int numOfComments;
  final bool hasImage;
  final String? imagePath;
  final String? profileImagePath;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.numOfComments = 0,
    this.hasImage = false,
    this.imagePath,
    this.profileImagePath,
  });

  // Generate initials for the profile avatar
  String getInitials(String name) {
    List<String> names = name.split(' ');

    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }

    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  // Profile avatar widget
Widget buildAvatar() {
  return CircleAvatar(
    radius: ScreenUtil().setSp(20),
    backgroundColor: FB_LIGHT_PRIMARY,
    child: profileImagePath != null
        ? ClipOval(
            child: Image.asset(
              profileImagePath!,
              width: ScreenUtil().setSp(40),
              height: ScreenUtil().setSp(40),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Text(
                  getInitials(userName),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(13),
                  ),
                );
              },
            ),
          )
        : Text(
            getInitials(userName),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(13),
            ),
          ),
  );
}

  // Image placeholder widget
  Widget buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(200),
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: ScreenUtil().setSp(50),
            color: Colors.grey[500],
          ),
          SizedBox(height: ScreenUtil().setHeight(8)),
          CustomText(
            text: 'Photo / Video',
            fontSize: ScreenUtil().setSp(13),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  // Post image widget
  Widget buildPostImage() {
    if (!hasImage && imagePath == null) {
      return const SizedBox.shrink();
    }

    if (imagePath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.asset(
          imagePath!,
          width: double.infinity,
          height: ScreenUtil().setHeight(200),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return buildImagePlaceholder();
          },
        ),
      );
    }

    return buildImagePlaceholder();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // USER PROFILE
            Row(
              children: [
                buildAvatar(),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: ScreenUtil().setSp(15),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // POST CONTENT
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // POST IMAGE
            buildPostImage(),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // LIKE AND COMMENT COUNTS
            Row(
              children: [
                Icon(
                  Icons.thumb_up,
                  color: FB_PRIMARY,
                  size: ScreenUtil().setSp(16),
                ),
                SizedBox(width: ScreenUtil().setWidth(5)),
                CustomText(
                  text: numOfLikes.toString(),
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.grey[700]!,
                ),
                const Spacer(),
                CustomText(
                  text: '$numOfComments comments',
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.grey[700]!,
                ),
              ],
            ),

            const Divider(),

            // LIKE, COMMENT, AND SHARE BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.thumb_up_outlined,
                    color: FB_DARK_PRIMARY,
                    size: ScreenUtil().setSp(18),
                  ),
                  label: CustomText(
                    text: 'Like',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment_outlined,
                    color: FB_DARK_PRIMARY,
                    size: ScreenUtil().setSp(18),
                  ),
                  label: CustomText(
                    text: 'Comment',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share_outlined,
                    color: FB_DARK_PRIMARY,
                    size: ScreenUtil().setSp(18),
                  ),
                  label: CustomText(
                    text: 'Share',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                  ),
                ),
              ],
            ),

            const Divider(),

            // COMMENT SECTION
            Row(
              children: [
                buildAvatar(),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(10),
                    ),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(35),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            CustomText(
              text: 'View comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
