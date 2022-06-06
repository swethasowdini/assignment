import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controllers/controller.dart';
import 'package:testproject/screens/editpost.dart';
import 'package:testproject/screens/newpost.dart';
import 'package:testproject/screens/postdetails.dart';

class Listofposts extends StatefulWidget {
  const Listofposts({Key? key}) : super(key: key);

  @override
  State<Listofposts> createState() => _ListofpostsState();
}

class _ListofpostsState extends State<Listofposts> {
  PostController controller = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Posts"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(const NewPost());
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add_circle,
                size: 32,
              ),
            ),
          ),
          Obx(() => (controller.postvalue.value)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 44, 206, 22),
                    ),
                    onPressed: () {
                      (controller.postvalue.value)
                          ? controller.filterlist()
                          : controller.fetchlist();
                      controller.postvalue.value = !controller.postvalue.value;
                    },
                    child: const Text(
                      "list of posts",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 22, 92, 150),
                    ),
                    onPressed: () {
                      (controller.postvalue.value)
                          ? controller.filterlist()
                          : controller.fetchlist();
                      controller.postvalue.value = !controller.postvalue.value;
                    },
                    child: const Text(
                      "My Posts",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ))
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          (() => (controller.isloading.value)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const Center(child: CircularProgressIndicator()),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.9,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        //length of json(response)
                        itemCount: controller.postList.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: (() {
                              (controller.postvalue.value)
                                  ? Get.to(PostDetails(
                                      userId: controller.postList[index].userId,
                                      getlist: controller.postList[index]))
                                  : Get.to(EditPost(
                                   userId: controller.postList[index].userId,
                                      getlist: controller.postList[index]
                                  ));
                            }),
                            child: ListTile(
                                title: Text(
                                  //for title
                                  controller.postList[index].title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                subtitle: Text(
                                  //for body
                                  controller.postList[index].body,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                trailing: (controller.postvalue.value)
                                    ? const SizedBox()
                                    : GestureDetector(
                                        onTap: (() {
                                          //print statement as success rest api working
                                          controller.deletelist(
                                              controller.postList[index].id);
                                          setState(() {
                                            controller.filterlist();
                                          });
                                        }),
                                        child: const Icon(
                                          Icons.delete,
                                          size: 28,
                                          color: Colors.blue,
                                        ),
                                      )),
                          );
                        }),
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            thickness: 0.6,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ],
                )),
        ),
      ),
    );
  }
}
