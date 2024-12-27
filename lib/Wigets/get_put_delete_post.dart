import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GPDPApiScreen extends StatefulWidget {
  const GPDPApiScreen({super.key});

  @override
  GPDPApiScreenState createState() => GPDPApiScreenState();
}

class GPDPApiScreenState extends State<GPDPApiScreen> {
  bool isLoading = false;
  String result = '';
  int postId = 0;
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    postOrDeleteApi(isGet: true);
  }

  Future<void> postOrDeleteApi({bool isDelete = false, bool isGet = false}) async {
    setState(() {
      isLoading = true;
    });

    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    Map<String, dynamic> body = {
      'title': 'First Post',
      'body': 'This is my first Post',
      'userId': '1',
    };

    if (isGet) {
      final response = await http.get(uri);

      setState(() {
        isLoading = false;
        if (response.statusCode == 200) {
          posts = json.decode(response.body);
          result = 'Posts fetched successfully';
        } else {
          result = 'Failed to fetch posts: ${response.statusCode}';
        }
      });
    } else if (isDelete) {
      if (postId == 0) {
        setState(() {
          result = 'No post to delete';
        });
        return;
      }

      uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId');
      final response = await http.delete(
        uri,
        headers: {'Content-Type': 'application/json'},
      );

      setState(() {
        isLoading = false;
        if (response.statusCode == 200) {
          result = 'Post deleted successfully: $postId';
        } else {
          result = 'Failed to delete post: ${response.statusCode}';
        }
      });
    } else {
      // POST operation: Create a new post
      final response = await http.post(
        uri,
        body: json.encode(body), // Encode body to JSON
        headers: {'Content-Type': 'application/json'},
      );

      setState(() {
        isLoading = false;
        if (response.statusCode == 201) {
          var responseBody = json.decode(response.body);
          postId = responseBody['id']; // Get the post ID from the response
          result = 'Post created successfully: ${response.body}';
        } else {
          result = 'Failed to create post: ${response.statusCode}';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post, Get & Delete API Example'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(result, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => postOrDeleteApi(isDelete: false), // Call postApi
                child: const Text('Create Post (POST)'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => postOrDeleteApi(isDelete: true), // Call deleteApi
                child: const Text('Delete Post (DELETE)'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => postOrDeleteApi(isGet: true), // Call getApi
                child: const Text('Fetch Posts (GET)'),
              ),
              const SizedBox(height: 20),
              if (posts.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index]['title']),
                        subtitle: Text(posts[index]['body']),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
