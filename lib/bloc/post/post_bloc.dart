import 'package:block_practices/bloc/post/post_events.dart';
import 'package:block_practices/bloc/post/post_states.dart';
import 'package:block_practices/models/post_model.dart';
import 'package:block_practices/repository/post_repository.dart';
import 'package:block_practices/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  List<PostModel> tempPostList = [];

  PostRepository postRepository = PostRepository();

  PostBloc() : super(PostStates()) {
    on<PostFetched>(_fetchPost);
    on<SearchItem>(_filterList);
  }

  void _filterList(SearchItem event, Emitter<PostStates> emit) async {
    if (event.stString.isEmpty) {
      emit(state.copyWith(tempPostList: [], searchMessage: ''));
    } else {
      tempPostList = state.postList
          .where(
            (element) => element.email.toString().toLowerCase().contains(
              event.stString.toLowerCase(),
            ),
          )
          .toList();

      // tempPostList = state.postList
      //     .where(
      //       (element) => element.id.toString() == event.stString.toString(),
      //     )
      //     .toList();
      if (tempPostList.isEmpty) {
        emit(
          state.copyWith(
            tempPostList: tempPostList,
            searchMessage: "No data Found",
          ),
        );
      } else {
        emit(state.copyWith(tempPostList: tempPostList));
      }
    }
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
