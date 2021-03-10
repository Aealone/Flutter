import 'http/http_service.dart';
// import 'post_detail.dart';
import 'http/posts_model.dart';
import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

class PostsPage extends StatelessWidget {
  // final HttpService httpService = HttpService();
  final List<dynamic> mylist = ["43", "44"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder <List<Post>>(
        future: HttpService().getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PostsList(posts: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


//  ListView.builder(
//   itemCount: mylist.length,
//   itemBuilder: (BuildContext context, int index) {
//     return Row(
//         children: [Text(mylist[index])]
//     );
//   },
// ),


class PostsList extends StatelessWidget {
  final List<Post> posts;

  PostsList({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: posts
        .map(
          (Post post) => SizedBox(
            height: 200,
            child: Column(
              children: [           
                // Text(post.gallery),
                // Text(post.category),
                Text(post.brand),
                // Text(post.color),
                // Text(post.oldPrice.toString()),
                // Text(post.newPrice.toString()),
                // Text(post.mainLink),
                // Text(mylist.toString()),
              ],
            ),
          ),
        ).toList(),
    );
  }
}

