import 'package:block_practices/bloc/get_api_practice_again/getPost_events.dart';
import 'package:block_practices/bloc/get_api_practice_again/getPost_states.dart';
import 'package:block_practices/repository/get_post_repository.dart';
import 'package:block_practices/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetpostStates>{


GetPostRepository postRepository = GetPostRepository();


GetPostBloc(): super(const GetpostStates()){
  on<FetchedPost> (fetchPostApi);
}

void fetchPostApi(FetchedPost event, Emitter<GetpostStates> emit) async{
 await postRepository.getfetchPost().then((value){
  emit(state.copyWith(
    postStatus:  PostStatus.success, 
  message: "Data Fetched Successfully..!",
  postList: value
  ));


}).onError((error, stackTrace) {
  emit(state.copyWith(postStatus: PostStatus.failure, message: "Error: $error"));
},);

}

}