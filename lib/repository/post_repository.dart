import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:block_practices/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List body = json.decode(response.body);
        return body
            .map(
              (e) => PostModel(
                postId: e["postId"],
                email: e["email"],
                body: e["body"],
              ),
            )
            .toList();
      } else {
        throw Exception("Server responded with ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("Internet connection error");
    } on TimeoutException {
      throw Exception("Request timeout");
    } catch (e, st) {
      print(st);
      throw Exception("Unexpected error: $e");
    }
  }

  // Future<List<PostModel>> fetchPost() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse("https://jsonplaceholder.typicode.com/comments"),
  //     );
  //     if (response.statusCode == 200) {
  //       final body = json.decode(response.body) as List;
  //       return body.map((e) {
  //         return PostModel(
  //           postId: e["postId"],
  //           email: e['email'] as String,
  //           body: e['body'] as String,
  //         );
  //       }).toList();
  //     }
  //   } on SocketException {
  //     throw Exception("Internet error occurs");
  //   } on TimeoutException {
  //     throw Exception("Response time out");
  //   }
  //   print(StackTrace);
  //   throw Exception("Error while fetching data");
  // }
}
