import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'posts_model.dart';

class HttpService {
  final String postsURL = "http://localhost:5000/sneakers?brand=PUMA&sizes=47.5";

  Future<List<Post>> getPosts() async {
    
    http.Response res = await http.get(postsURL);
    // final otvet = res.statusCode;
    if (res.statusCode == 200) {

      List<dynamic> body = jsonDecode(res.body);
      
      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();
      
      return posts;
    } else {

      throw "Can't get posts.";
    }
  }
}