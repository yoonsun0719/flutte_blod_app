import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController{

  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;


  @override
  void onInit() {
    super.onInit();
   print('안녕');
   findAll();
  }

  Future<void> findAll() async{
    List<Post> posts = await _postRepository.findAll();
    this.posts.value=posts;
  }

  Future<void> findById(int id) async{
    Post post =await _postRepository.findById(id);
    this.post.value = post;
  }
}