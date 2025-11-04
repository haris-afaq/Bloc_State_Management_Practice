import 'package:block_practices/models/post_model.dart';
import 'package:block_practices/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final String message;
  final String searchMessage;

  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempPostList = const <PostModel>[],
    this.message = '',
    this.searchMessage = '',
  });

  PostStates copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    List<PostModel>? tempPostList,
    String? message,
    String? searchMessage,
  }) {
    return PostStates(
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      tempPostList: tempPostList ?? this.tempPostList,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [
    postStatus,
    postList,
    tempPostList,
    message,
    searchMessage,
  ];
}
