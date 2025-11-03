import 'package:block_practices/bloc/post/post_events.dart';
import 'package:block_practices/bloc/post/post_states.dart';
import 'package:block_practices/repository/post_repository.dart';
import 'package:block_practices/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  PostRepository postRepository = PostRepository();
  PostBloc() : super(PostStates()) {
    on<PostFetched>(_fetchPost);
  }

  void _fetchPost(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository
        .fetchPost()
        .then((value) {
          emit(state.copyWith(postStatus: PostStatus.success, postList: value));
        })
        .onError((error, StackTrace) {
          print(StackTrace);
          print(error);
          emit(
            state.copyWith(
              postStatus: PostStatus.failure,
              message: error.toString(),
            ),
          );
        });
  }
}
