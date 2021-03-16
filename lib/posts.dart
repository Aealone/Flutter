import 'http/http_service.dart';
// import 'post_detail.dart';
import 'http/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/constants.dart';


// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

class PostsPage extends StatelessWidget {
  // final HttpService httpService = HttpService();
  final List<dynamic> mylist = ["43", "44"];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<Post>>(
        future: HttpService().getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PostsGrid(posts: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
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


// class PostsList extends StatelessWidget {
//   final List<Post> posts;

//   PostsList({Key key, this.posts}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: posts
//         .map(
//           (Post post) => SizedBox(
//             height: 200,
//             child: Column(
//               children: [           
//                 // Text(post.gallery),
//                 // Text(post.category),
//                 Text(post.brand),
//                 // Text(post.color),
//                 // Text(post.oldPrice.toString()),
//                 // Text(post.newPrice.toString()),
//                 // Text(post.mainLink),
//                 // Text(mylist.toString()),
//               ],
//             ),
//           ),
//         ).toList(),
//     );
//   }
// }

class PostsGrid extends StatelessWidget {
  final List<Post> posts;

  PostsGrid({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.white,
          child: GridView.builder(
            controller: scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.5,
              crossAxisCount: 2,
              crossAxisSpacing: kDefaultPadding,
              mainAxisSpacing: kDefaultPadding,
            ),
            itemCount: posts.length,

            itemBuilder: (context, index) {
              return ProductCard(
                image: "http://a.lmcdn.ru/img236x341/P/U/PU053AMKAGH7_12148998_1_v1.jpg",
                sizes: posts[index].sizes.toString(),
                brand: posts[index].brand,
                oldPrice: posts[index].oldPrice,
                newPrice: posts[index].newPrice,
              );
            },
          ),
        );
      },
    );
  }
}

