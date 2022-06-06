import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:testproject/controllers/controller.dart';
import 'package:testproject/services/postservices.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  String? title = "";
  String body = "";
  PostController controller = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new post"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: height * 0.01, right: height * 0.01),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'title',
              ),
              onChanged: (value) {
                title = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'body',
              ),
              onChanged: (value) {
                body = value;
              },
              maxLines: 4,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> data = {
                  "title": title,
                  "body": body,
                  "userId": 2,
                };
                //Important: resource will not be really updated on the server but it will be faked as if.
                String? res = await Postservices.createpost(data);
                res == "success"
                    ? Fluttertoast.showToast(msg: "Post created successfully")
                    : Fluttertoast.showToast(
                        msg: "Post not created successfully");
                Navigator.of(context).pop();
              },
              child: const Text(
                "Save",
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
