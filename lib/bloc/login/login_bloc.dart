import 'package:bloc/bloc.dart';
import 'package:block_practices/bloc/login/login_event.dart';
import 'package:block_practices/bloc/login/login_states.dart';
import 'package:block_practices/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginStates>{


LoginBloc(): super(const LoginStates()){
  on<EmailChanged>(onEmailChanged);
  on<PasswordChanged>(onPasswordChnages);
  on<LoginApi> (onLoginApi);
 

}


void onEmailChanged(EmailChanged event, Emitter<LoginStates>  emit){
  emit(state.copyWith(email: event.email));
}

void onPasswordChnages(PasswordChanged event, Emitter<LoginStates> emit){
  emit(state.copyWith(
    password: event.password
  ));
}

void onLoginApi(LoginApi event, Emitter<LoginStates> emit) async{
  emit(state.copyWith(
    loginStatus: LoginStatus.loading
  ));
  Map data = {
    "email": state.email,
    "password": state.password,
  };

  try{
    final response = await http.post(Uri.parse("https://reqres.in/api/login"), body: data);
    if (response.statusCode==200){
      emit(state.copyWith(
        loginStatus: LoginStatus.success,
        message: "Login Successful",
      ));
    
    }
    else{
      emit(state.copyWith(
        loginStatus: LoginStatus.error,
        message: "Login failed..!"
      ));
    }
  }
  catch(e){
    emit(state.copyWith(
      loginStatus: LoginStatus.error,
      message: e.toString()
    ));
  }
}

}