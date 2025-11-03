import 'package:equatable/equatable.dart';

abstract class PostEvents extends Equatable {
  const PostEvents();
  List<Object> get props => [];
}

class PostFetched extends PostEvents {}
