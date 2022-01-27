

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:joli/screens/employeedashboard.dart';

class EmployeeDashboard extends StatefulWidget {

  static String id='employee_dashboard_screen';
  final String nameEmployee;

  EmployeeDashboard( this.nameEmployee);

  @override
  _EmployeeDashboardState createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  static final FirebaseFirestore  _firestore = FirebaseFirestore.instance;
  static final _CollectionReference = _firestore.collection("employees").doc("employeesinfo").collection("profile");
  static final _DocumentReference = _CollectionReference.doc('profileinfo');

  String name,phoneNo,district,profession;
  @override
  void initState() {
    // TODO: implement initState
    readData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:   Text("Employee DashBoard",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                height: 100,
                width: 500,
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey,width: 2),
                ),

              ),
              const SizedBox(height: 10.0),


              const SizedBox(height: 10.0),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("$name",
              style: TextStyle(fontSize: 20.0),
              ),
            ),
            height: 75,
          width: 500,
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey,width: 2),
          ),

          ),
              const SizedBox(height: 10.0),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("$phoneNo",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                height: 75,
                width: 500,
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey,width: 2),
                ),

              ),

              const SizedBox(height: 10.0),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("$district",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                height: 75,
                width: 500,
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey,width: 2),
                ),

              ),
              const SizedBox(height: 10.0),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("$profession",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                height: 75,
                width: 500,
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey,width: 2),
                ),

              ),


            ]
          ),
        ),
      ),
    );
  }

  readData() async {
    var documentsnapshot = await  _CollectionReference.doc(widget.nameEmployee).get();
    if(documentsnapshot.exists){
      Map<String,dynamic> data = documentsnapshot.data();
      Fluttertoast.showToast(msg: data['Name']);
      setState(() {
        name=data['Name'];
        phoneNo=data['PhoneNo'];
        district=data['District'];
        profession=data['Profession'];


      });
    }else{
      CircularProgressIndicator();
    }
  }
}
