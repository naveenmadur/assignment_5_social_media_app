import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/models/post_data.dart';
import '../providers/user_posts.dart';
import '../constants.dart';

class Posts extends StatefulWidget {
  // Posts({Key? key, required this.post});
  const Posts({Key? key, required this.postData}) : super(key: key);
  final PostData postData;

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    final bookmark = Provider.of<UserPosts>(context, listen: false);
    return Container(
      decoration: postContainerDecoration,
      margin: postContainerMargin,
      padding: postContainerPadding,
      child: Stack(alignment: AlignmentDirectional.topCenter, children: [
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      NetworkImage(widget.postData.owner!.picture.toString()),
                ),
                Expanded(
                    child: ListTile(
                  title: Text(widget.postData.owner!.firstName.toString() +
                      widget.postData.owner!.lastName.toString()),
                  subtitle: const Text('@Claire15'),
                ))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.28),
                child: Image.network(
                  widget.postData.image.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 2.815,
            child: Container(
              decoration: postActionButtonDecoration,
              width: MediaQuery.of(context).size.width / 1.11,
              height: MediaQuery.of(context).size.height / 18,
              padding: postActionButtonPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const PostButtons(icon: Icons.comment_rounded),
                      const Text(
                        '10',
                        style: postActionButtonTextStyle
                      ),
                      const PostButtons(
                        icon: Icons.favorite_border,
                      ),
                      Text(
                        widget.postData.likes.toString(),
                        style: postActionButtonTextStyle,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PostButtons(
                        icon: Icons.share,
                      ),
                      IconButton(
                          onPressed: () {
                            bookmark.toogleBookmarks(widget.postData);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                widget.postData.isBookmarked
                                    ? const Text('Added to Bookmark')
                                    : const Text('Removed from Bookmark'),
                                const SizedBox(
                                  width: 20,
                                ),
                                widget.postData.isBookmarked
                                    ? const Icon(Icons.check,
                                        color: Colors.green)
                                    : const Icon(Icons.close,
                                        color: Colors.red),
                              ],
                            )));
                            // const AlertDialog(title: Text('Bookmark Added'));
                          },
                          icon: const Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          )),
                    ],
                  )
                ],
              ),
            ))
      ]),
    );
  }
}

class PostButtons extends StatelessWidget {
  const PostButtons({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.white,
        ));
  }
}
