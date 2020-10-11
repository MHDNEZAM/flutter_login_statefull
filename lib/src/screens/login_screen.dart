import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{

   createState() {

    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{

  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(20.0),
      child:Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@eample.com',
      ),
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
    );

  }

  Widget submitButton(){
    return RaisedButton(
      color: Colors.lightBlue,
      child: Text('Submit!'),
      onPressed: (){
        formKey.currentState.reset();
      },


    );

  }
}