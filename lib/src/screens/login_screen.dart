import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{

   createState() {

    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{

  final formKey = GlobalKey<FormState>();
  String email='';
  String password='';

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
      validator: (String value) {
        if(!value.contains('@')){
          return 'Please enter a valid email';
        }
      },
      onSaved:(String newValue) {
        email = newValue;
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: (String value) {
        if( value.length < 4){
          return 'Password must be at least 4 characters';
        }
      },
      onSaved: (String newValue) {
        password = newValue;

      },
    );

  }

  Widget submitButton(){
    return RaisedButton(
      color: Colors.lightBlue,
      child: Text('Submit!'),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          print(email +' '+ password);
          print('Time to post $email and my $password to API!');
        };
      },


    );

  }
}