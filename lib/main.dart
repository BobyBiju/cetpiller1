//@dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:joli/screens/createprofileemployee.dart';
import 'package:joli/screens/employeedashboard.dart';
import 'package:joli/screens/employeelogin.dart';
import 'package:joli/screens/employeeloginregister.dart';
import 'package:joli/screens/employeeregistration.dart';
import 'package:joli/screens/employerdashboard.dart';
import 'package:joli/screens/employerlogin.dart';
import 'package:joli/screens/employerloginregister.dart';
import 'package:joli/screens/employerregistration.dart';
import 'package:joli/screens/openingscreen.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OpeningScreen.id,

      routes: {

        OpeningScreen.id: (context) =>OpeningScreen(),

        EmployerRegistrationScreen.id: (context) =>EmployerRegistrationScreen(),
        EmployerLoginRegisterScreen.id:(context)=>EmployerLoginRegisterScreen(),
        EmployerDashboard.id:(context)=>EmployerDashboard(),
        EmployerLoginScreen.id:(context)=>EmployerLoginScreen(),

        EmployeeLoginRegisterScreen.id:(context)=>EmployeeLoginRegisterScreen(),
        EmployeeRegistrationScreen.id:(context) =>EmployeeRegistrationScreen(),
        EmployeeProfileCreation.id:(context)=>EmployeeProfileCreation(),
        // EmployeeDashboard.id:(context)=>EmployeeDashboard(),
        EmployeeLoginScreen.id:(context)=>EmployeeLoginScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(


      ),
      home: OpeningScreen(),
    );
  }
}


