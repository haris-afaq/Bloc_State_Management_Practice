import 'dart:convert';
import 'package:block_practices/models/post_model.dart';
import 'package:http/http.dart' as http;

class GetPostRepository {

  Future<List<PostModel>> getfetchPost() async {
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/comments")
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;

        return body.map((e) {
          return PostModel(
            postId: e["postId"] as int,
            email: e["email"] as String,
            body: e["body"] as String,
          );
        }).toList();
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }

    } catch (e) {
      throw Exception("Error while fetching data: $e");
    }
  }
}
