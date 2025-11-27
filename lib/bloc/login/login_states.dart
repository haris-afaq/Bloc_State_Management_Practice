import 'package:block_practices/utils/enums.dart';
import 'package:equatable/equatable.dart';


class LoginStates extends Equatable{
final String email;
final String password;
final String message;
final LoginStatus loginStatus;

const LoginStates({
this.email="",
this.password="",
this.message="",
this.loginStatus= LoginStatus.initial,

});

LoginStates copyWith({
String? email, String?message, String? password, LoginStatus? loginStatus
}){
 return LoginStates(
   email:email?? this.email,
  password:password ?? this.password,
  loginStatus: loginStatus?? this.loginStatus,
  message:message?? this.message,
 );
}

@override
List<Object> get props => [email, password, message, loginStatus];
}