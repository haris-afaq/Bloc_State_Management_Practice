import 'package:block_practices/bloc/get_api_practice_again/getPost_events.dart';
import 'package:block_practices/bloc/get_api_practice_again/getPost_states.dart';
import 'package:block_practices/bloc/get_api_practice_again/get_post_bloc.dart';
import 'package:block_practices/bloc/post/post_states.dart';
import 'package:block_practices/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetApiHome extends StatefulWidget {
  const GetApiHome({super.key});

  @override
  State<GetApiHome> createState() => _GetApiHomeState();
}

class _GetApiHomeState extends State<GetApiHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<GetPostBloc>().add(FetchedPost());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Get API",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w500
        ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
      ),


      body: BlocBuilder<GetPostBloc, GetpostStates>(
        builder: (context, state){
          switch(state.postStatus){
            case PostStatus.loading:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                color: Colors.deepPurple, strokeWidth: 5,),
                const SizedBox(height: 10,),
                Text("Loading Data...!")
                ],
              ));
            case PostStatus.success:
            return ListView.builder(
              itemCount: state.postList.length,
          itemBuilder: (context, index){
            final item = state.postList[index];
          return ListTile(
            title: Text(item.email.toString()),
            subtitle: Text(item.body.toString()),
            
          );
        });
        case PostStatus.failure:
        return Center(child: Text(state.message.toString()));
          }
        
      }),
    );
  }
}