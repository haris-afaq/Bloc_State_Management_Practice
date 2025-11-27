
import 'package:block_practices/config/routing/route_names.dart';
import 'package:block_practices/view/login_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){


    switch(settings.name){
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (context)=>
        LoginScreen()
        );
        
      // Esi tarah baaqi bhi karle

      default:
      return MaterialPageRoute(builder: (context){
        return Scaffold(
          body: Center(
            child: Text("No route generated...!"),
          ),
        );

        /*es ke baad main.dart mae home ki jaga pe initial route ko set karna hai like:

        initialRoute: RouteNames.splashscreen
        onGenerateRoute: Routes.generateRoute,

        */

        /*es ke baad agar hamne navigate karna hua tu ese karengy: button koi bhi hu sakta
        
        TextButton(onPressed:(){
        Navigator.pushNamed(context: RouteNames.loginScreen);
        },
        
        child: Text("Click"),
        )
        
        */

        
      });
    }

  } 
}