import 'package:get/get.dart';
import 'package:testproject/models/listpojo.dart';
import 'package:testproject/services/postservices.dart';

class PostController extends GetxController {
  var postList = <Getlist>[].obs;
  var isloading = true.obs;
  var postvalue = true.obs;
  @override
  void onInit() {
    fetchlist();
    super.onInit();
  }

  void fetchlist() async {
    try {
      var post = await Postservices.fetchList();
      postList.value = post!;
      if (post.isEmpty) {
        postList.addAll(post);
      } else {}
    } catch (e) {
      throw e;
    } finally {
      isloading(false);
    }
  }
  void deletelist(id) async {
    try {
      var post = await Postservices.deletepost(id);
      postList.value = post!;
      if (post.isEmpty) {
        postList.addAll(post);
      } else {}
    } catch (e) {
      throw e;
    } finally {
      isloading(false);
    }
  }

  void filterlist() async {
    try {
      var post = await Postservices.filterlist();
      postList.value = post!;
      if (post.isEmpty) {
        postList.addAll(post);
      } else {}
    } catch (e) {
      throw e;
    } finally {
      isloading(false);
    }
  }

  void createpost(data) async {
    try {
      var createpost = await Postservices.createpost(data);
      postList.value = createpost! as List<Getlist>;
      print(createpost);
      print('-------------------------createpost');
    } catch (e) {
      throw e;
    } finally {
      isloading(false);
    }
  }
}
