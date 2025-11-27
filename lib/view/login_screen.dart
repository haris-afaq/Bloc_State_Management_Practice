import 'package:block_practices/bloc/login/login_bloc.dart';
import 'package:block_practices/bloc/login/login_event.dart';
import 'package:block_practices/bloc/login/login_states.dart';
import 'package:block_practices/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;

  final emailFocusNode=FocusNode();
  final passwordFocusNode=FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc =LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Login API",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600
        ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
      ),


      body: BlocProvider(
        
        create: (context)=> _loginBloc,
        
     child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //We have store the value of Email and password in a variable that's why we have to wrap them in BlocBuilder
            BlocBuilder<LoginBloc, LoginStates>(

              buildWhen: (current, previous)=> current.email != previous.email,

              builder: (context, state){
              return TextField(
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value){
                // here we have to pass the context to read the value of email

                context.read<LoginBloc>().add(EmailChanged(email: value));

              },
              onSubmitted: (value){},
              decoration: InputDecoration(
                hint: Text("Email"),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            );
            }),
            SizedBox(height: 15,),
                     //We have store the value of Email and password in a variable that's why we have to wrap them in BlocBuilder  
           BlocBuilder<LoginBloc, LoginStates>(

            buildWhen: (previous, current) => current.password!=previous.password,

            builder: (context, state){
            return  TextField(focusNode: passwordFocusNode,
            onChanged: (value){
              
              context.read<LoginBloc>().add(PasswordChanged(password: value));

            },
            onSubmitted: (value){},
            decoration: InputDecoration(
              hint: Text("Password"),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock_outline)
            ),
            obscureText: true,
        
            );
           }),
        
        
            SizedBox(height: 40,),

            BlocListener<LoginBloc, LoginStates>(listener: (context, state){
              if(state.loginStatus == LoginStatus.loading){
                 print("Loading...");
              }
              else if(state.loginStatus== LoginStatus.error){
                print(state.message.toString());
              }
              else if(state.loginStatus==LoginStatus.success){
               print("Login Successful");
              }
            },
            child:    BlocBuilder<LoginBloc, LoginStates>(
            buildWhen: (previous, current) => false,
            builder: (
              context, state){
              return   SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5)
                  )
                ),
                onPressed: (){
                  context.read<LoginBloc>().add(LoginApi());

                }, child: Text("Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),
                )),
            );
            })
            )
          ],
        ),
      ),
      
      )
    );
  }
}