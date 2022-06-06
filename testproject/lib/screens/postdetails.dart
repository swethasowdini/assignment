import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controllers/controller.dart';
import 'package:testproject/models/listpojo.dart';


class PostDetails extends StatefulWidget {
  PostDetails({Key? key, required this.userId, required this.getlist})
      : super(key: key);
  Getlist? getlist;
  int userId;
  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  String? title;
  String? body;
  PostController controller = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Post Details"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: height * 0.02,
                    right: height * 0.02,
                    top: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Title",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: height * 0.02,
                    right: height * 0.02,
                    top: height * 0.02),
                child: Row(
                  children: [Expanded(child: Text(widget.getlist!.title))],
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: height * 0.02,
                    right: height * 0.02,
                    top: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Body",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Center(child: Text(widget.getlist!.body)),
            ],
          )),
        ));
  }
}


