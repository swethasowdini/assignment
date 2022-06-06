import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controllers/controller.dart';
import 'package:testproject/models/listpojo.dart';
import 'package:testproject/services/postservices.dart';

class EditPost extends StatefulWidget {
  EditPost({Key? key, required this.userId, required this.getlist})
      : super(key: key);
  Getlist? getlist;
  int userId;
  String? title;
  String? body;
  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  @override
  void initState() {
    super.initState();
    setState(() {
      userId = widget.userId.toString();
      _titlecontroller.text = widget.getlist!.title;
      _bodycontroller.text = widget.getlist!.body;
    });
  }

  PostController controller = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
            title: const Text("Edit Post Details"),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: (() {
                  _displayTextInputDialog(context);
                }),
                child: Icon(Icons.edit),
              )
            ]),
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

  String? title = "";
  String? body = "";
  String? userId = "";
  String? codeDialog = "";
  String? codeDialog1 = "";
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _bodycontroller = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
              child: AlertDialog(
            title: TextField(
              controller: _titlecontroller,
              decoration: InputDecoration(hintText: "title"),
            ),
            content: TextField(
              controller: _bodycontroller,
              decoration: InputDecoration(hintText: "body"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Update"),
                onPressed: () {
                  setState(() {
                    Postservices.updatepost(
                        _titlecontroller.text,
                        _bodycontroller.text,
                        widget.userId.toString(),
                        widget.getlist!.id);
                    Navigator.of(context).pop();
                  });
                },
              )
            ],
          ));
        });
  }
}
