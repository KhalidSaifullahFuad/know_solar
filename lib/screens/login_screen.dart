import 'package:flutter/material.dart';
import 'package:know_solar/main.dart';
import 'package:know_solar/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image(image: AssetImage("images/logo.png"),),
            Image.asset("assets/images/logo.png",height: 200,width: 200,),
            SizedBox(height: 100,),
            GestureDetector(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                margin: EdgeInsets.symmetric(vertical: 10),
                elevation: 10 ,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white),),
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
            ),
            GestureDetector(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                elevation: 10 ,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text("Sign In",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.green),),
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
            ),
          ],
        ),

      ),
    );
  }
}
