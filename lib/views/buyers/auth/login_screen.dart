import 'package:courseflutter/controllers/auth_controller.dart';
import 'package:courseflutter/utils/show.snackBar.dart';
import 'package:courseflutter/views/buyers/main_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;

  late String password;

  bool _isLooding = false;

  _loginUsers()async{
    setState(() {
      _isLooding = true;
    });
    if(_formKey.currentState!.validate()){
      await _authController.loginUsers(email, password);
      return Navigator.pushReplacement
      (context, MaterialPageRoute(
        builder: (BuildContext context){
          return MainScreen();
      }));
    }else{
      setState(() {
        _isLooding = false;
      });
      return showSnack(context, 'Please fields must be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Customers"s Account',
                 style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                      validator: (value ){
                        if(value!.isEmpty){
                          return 'Please Email Field must not be empty';
                        }else{
                          return null;
                        }
                      },
                      onChanged: ((value) {
                        email = value;
                      }),
                      decoration: InputDecoration(
                      labelText: 'Enter Email',
                    ),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Password must not be empty';
                          }else{
                            return null;
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                      labelText: 'Enter Password',
                   ),
                 ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: (){
                        _loginUsers();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade900,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: _isLooding
                           ? CircularProgressIndicator(
                            color: Colors.white,)
                            : Text(
                            'Login',
                            style: TextStyle(
                              letterSpacing: 5,
                              color: Colors.white,
                              ),
                              ),
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('Need Account?'),
                      TextButton(
                        onPressed: (){},
                         child: Text(
                          'Register',
                          ),
                          ),
                    ],)
        
            ],
          ),
        ),
      ),
    );
  }
}