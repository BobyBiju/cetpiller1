

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:joli/screens/employeedashboard.dart';

class EmployerDashboard extends StatefulWidget {

  static String id='employer_dashboard_screen';

  @override
  _EmployerDashboardState createState() => _EmployerDashboardState();
}

class _EmployerDashboardState extends State<EmployerDashboard> {
  static final FirebaseFirestore  _firestore = FirebaseFirestore.instance;
  static final _CollectionReference = _firestore.collection("employees").doc("employeesinfo").collection("profile");
  static final _DocumentReference = _CollectionReference.doc('profileinfo');

  String name,phoneNo,district,profession;
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


                StreamBuilder(
                  stream: _CollectionReference.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                            snapshot.data.docs[index];
                            return Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(documentSnapshot["Name"]),
                                ),
                                Expanded(
                                  child: Text(documentSnapshot["PhoneNo"]),
                                ),
                                Expanded(
                                  child: Text(documentSnapshot["District"]),
                                ),
                                Expanded(
                                  child: Text(
                                      documentSnapshot["Profession"]),
                                )
                              ],
                            );
                          });
                    } else {
                      return Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ]
          ),
        ),
      ),
    );
  }

}