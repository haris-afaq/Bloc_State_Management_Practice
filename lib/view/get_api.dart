import 'package:block_practices/bloc/post/post_bloc.dart';
import 'package:block_practices/bloc/post/post_events.dart';
import 'package:block_practices/bloc/post/post_states.dart';
import 'package:block_practices/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  @override
  void initState() {
    super.initState();

    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Get API with Bloc",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              {
                return Center(child: CircularProgressIndicator());
              }
            case PostStatus.success:
              {
                return Column(
                  children: [
                    SizedBox(height: 15),
                    TextFormField(
                      onChanged: (filterKey) {
                        context.read<PostBloc>().add(SearchItem(filterKey));
                      },
                      cursorColor: Colors.deepPurple,
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        suffixIcon: Icon(Icons.search_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: state.searchMessage.isNotEmpty
                          ? Center(child: Text(state.searchMessage.toString()))
                          : ListView.builder(
                              itemCount: state.tempPostList.isEmpty
                                  ? state.postList.length
                                  : state.tempPostList.length,
                              // itemCount: state.postList.length,
                              itemBuilder: (context, index) {
                                if (state.tempPostList.isNotEmpty) {
                                  final item = state.tempPostList[index];
                                  return Card(
                                    color: Colors.white,
                                    elevation: 1.3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(5),
                                    ),
                                    child: ListTile(
                                      title: Text(item.email.toString()),
                                      subtitle: Text(item.body.toString()),
                                    ),
                                  );
                                } else {
                                  final item = state.postList[index];
                                  return Card(
                                    color: Colors.white,
                                    elevation: 1.3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(5),
                                    ),
                                    child: ListTile(
                                      title: Text(item.email.toString()),
                                      subtitle: Text(item.body.toString()),
                                    ),
                                  );
                                }
                              },
                            ),
                    ),
                  ],
                );
              }
            case PostStatus.failure:
              {
                return Center(child: Text(state.message.toString()));
              }
          }
        },
      ),
    );
  }
}
