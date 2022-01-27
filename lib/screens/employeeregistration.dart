// import 'package:todoey/MyScreens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:joli/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:joli/screens/createprofileemployee.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class EmployeeRegistrationScreen extends StatefulWidget {

  static String id='employee_registration_screen';
  @override
  _EmployeeRegistrationScreenState createState() => _EmployeeRegistrationScreenState();
}

class _EmployeeRegistrationScreenState extends State<EmployeeRegistrationScreen> {

  final _auth=FirebaseAuth.instance;

  bool showSpinner=false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(tag: 'logo',
                  child: Container(
                    height: 150.0,
                    child: Image.asset('images/laborer.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  email=value;
                },
                decoration: kTextfieldDecoration.copyWith(
                    hintText: 'Enter your email'
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(textAlign: TextAlign.center,obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    password=value;
                  },
                  decoration: kTextfieldDecoration.copyWith(hintText: 'Enter your 6 digit password')
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async{
                      setState(() {
                        showSpinner=true;
                      });

                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if(newUser!=null){
                          Navigator.pushNamed(context, EmployeeProfileCreation.id);
                        }
                        setState(() {
                          showSpinner=false;
                        });

                      } catch(e)
                      {print(e);}
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}