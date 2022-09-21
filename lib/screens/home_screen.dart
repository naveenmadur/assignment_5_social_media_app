import 'package:flutter/material.dart';
import 'package:social_media_app/providers/owner_data.dart';
import '../widgets/story.dart';
import '../widgets/posts.dart';
import '../providers/user_posts.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.showBookmarks}) : super(key: key);
  final bool showBookmarks;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _fetchPostData() async {
    return await Provider.of<UserPosts>(context, listen: false).fetchPostData();
  }

  Future<void> _fetchOwnerData() async {
    return await Provider.of<OwnerData>(context, listen: false)
        .fetchOwnerData();
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.showBookmarks
        ? Provider.of<UserPosts>(context).bookmark()
        : Provider.of<UserPosts>(context, listen: false).postList;
    final user = Provider.of<OwnerData>(context, listen: false).ownerList;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: FutureBuilder(
                future: _fetchOwnerData(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return ListView.builder(
                      itemBuilder: (context, index) => Story(
                            name: user[index].firstName.toString(),
                            imageUrl: user[index].picture.toString(),
                          ),
                      itemCount: user.length,
                      scrollDirection: Axis.horizontal);
                },
              )),
          SizedBox(
              // color: Colors.red,
              height: MediaQuery.of(context).size.height / 1.55,
              child: FutureBuilder(
                future: _fetchPostData(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Posts(
                        postData: post[index],
                      ),
                      itemCount: post.length,
                    );
                  } else {
                    return progreeIndicator;
                  }
                },
              ))
        ],
      ),
    );
  }
}
