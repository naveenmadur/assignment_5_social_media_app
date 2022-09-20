import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_posts.dart';

class Posts extends StatefulWidget {
  // Posts({Key? key, required this.post});
  const Posts(
      {Key? key,
      required this.imageUrl,
      required this.likes,
      required this.userName,
      required this.userPfp,
      required this.id,
      required this.index})
      : super(key: key);
  final String imageUrl, likes, userName, userPfp, id;
  final int index;

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    final flag = Provider.of<UserPosts>(context).flag;
    final bookmark = Provider.of<UserPosts>(context, listen:false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.30),
        color: const Color.fromRGBO(230, 238, 250, 1),
      ),
      margin: const EdgeInsets.only(left: 10.9, right: 10.9, bottom: 20.9),
      padding: const EdgeInsets.all(10.9),
      child: Stack(alignment: AlignmentDirectional.topCenter, children: [
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(widget.userPfp),
                ),
                Expanded(
                    child: ListTile(
                  title: Text(widget.userName),
                  subtitle: const Text('@Claire15'),
                ))
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.28),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 2.815,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.28),
                  bottomRight: Radius.circular(30.28),
                ),
              ),
              width: MediaQuery.of(context).size.width / 1.11,
              height: MediaQuery.of(context).size.height / 18,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PostButtons(icon: Icons.comment_rounded),
                      const Text(
                        '10',
                        style: TextStyle(color: Colors.white),
                      ),
                      const PostButtons(
                        icon: Icons.favorite_border,
                      ),
                      Text(
                        widget.likes,
                        style: const TextStyle(color: Colors.white),
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
                            bookmark.addBookmarks(widget.id);
                            bookmark.toggleBookmark(widget.index);
                          },
                          icon: Icon(
                            Icons.bookmark,
                            color:
                                flag[widget.index] ? Colors.red : Colors.white,
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
