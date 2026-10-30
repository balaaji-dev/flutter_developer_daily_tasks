import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}): super(key : key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();

  trysubmit(){
    final isvalid = _formKey.currentState!.validate();
    if(isvalid){
      _formKey.currentState!.save();
      submitform();
    }else{
      print('error');
    }
  }

  submitform(){
    print(firstName);
    print(lastName);
    print(email);
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child:Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Enter the first name'),
            key: ValueKey('firstName'),
                validator: (value){
                  if(value.toString().isEmpty){
                    return 'FirstName should not be empty';
                  }else{
                    return null;
                  }

                },
                onSaved: (value) {
                    firstName=value.toString();
                },
                ),

                TextFormField(
                  decoration: InputDecoration(hintText: 'Enter the last name'),
                  key: ValueKey('lastName'),
                  validator: (value){
                    if(value.toString().isEmpty){
                      return 'lastName should not be empty';
                    }else{
                      return null;
                    }
                  },onSaved: (value) {
                  lastName=value.toString();
                },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Enter email'),
                  key: ValueKey('email'),
                  validator: (value){
                    if(value.toString().isEmpty){
                      return 'email should not be empty';
                    }else{
                      return null;
                    }
                  },onSaved: (value) {
                  email=value.toString();
                },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Enter the password'),
                  key: ValueKey('password'),
                  validator: (value){
                    if(value.toString().length<=5){
                      return 'password should be more than 5 ';
                    }else{
                      return null;
                    }
                  },onSaved: (value) {
                  password=value.toString();
                },
                ),
                TextButton(onPressed: (){
                  trysubmit();
                }, child: Text('submit'))
              ],
            )
          ),
        )
      ),



    );
  }
}
