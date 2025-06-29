import 'package:flutter/material.dart';
import 'package:meet/resources/auth_methods.dart';
import 'package:meet/utils/colors.dart';
import 'package:meet/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.video_chat,size: 200,color:buttonColor),
            Text(
              'Start or Join a meeting',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
            ),
            SizedBox(height:20),
            CustomButton(text: 'G',onPressed: ()async{
              bool res = await _authMethods.signInWithGoogle(context);
              if(res){
                Navigator.pushNamed(context, '/home');
              }
            },)
          ],
        ),
      ),
    );
  }
}
