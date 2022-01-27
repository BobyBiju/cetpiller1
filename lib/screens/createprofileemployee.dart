import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:joli/screens/employeedashboard.dart';

// import 'package:hive_localdatabase/db/functions/db_functions.dart';
// import 'package:hive_localdatabase/db/model/data_model.dart';




class EmployeeProfileCreation extends StatefulWidget {


  static String id='employee_create_profile_screen';

  @override
  _EmployeeProfileCreationState createState() => _EmployeeProfileCreationState();
}

class _EmployeeProfileCreationState extends State<EmployeeProfileCreation> {

  String employee;
  static final FirebaseFirestore  _firestore = FirebaseFirestore.instance;
  static final _CollectionReference = _firestore.collection("employees").doc("employeesinfo").collection("profile");
  static final _DocumentReference = _CollectionReference.doc("employee");

  final nameController= TextEditingController();
  final phoneNoController = TextEditingController();
  final districtController= TextEditingController();
  final professionController=TextEditingController();


  final items = ['Electrician','plumber','Carpenter','Handyman'];
  String value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: phoneNoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'PhoneNO',
                ),
              ),
              const SizedBox(height: 10.0),

              TextFormField(
                controller: districtController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'District',
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey,width: 2),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(

                    value: value,
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                    isExpanded: true,
                    items: items.map(buildMenuItem).toList(),
                  onChanged: (value){setState(() {

                    this.value=value;
                  });},
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton.icon(
                onPressed: (){
                  onAddStudentButtonClicked();

                },
                icon: const Icon(Icons.add),
                label: const Text('Create Profile'),
              )

            ],
          ),
        ),
      ),

    );

  }

  DropdownMenuItem<String> buildMenuItem(String item)=>DropdownMenuItem(
      value: item,
    child: Text(
      item,
      style: TextStyle(fontWeight: FontWeight.normal,fontSize:20),
    ),
  );

   onAddStudentButtonClicked() {
    final _name =nameController.text.trim();
    final _phoneNo =phoneNoController.text.trim();
    final  _district=districtController.text.trim();
    final _profession=value;
    addData(_name,_phoneNo,_district,_profession);
    if(_name.isEmpty||_phoneNo.isEmpty||_district.isEmpty){
      return ;
    }


    nameController.clear();
    phoneNoController.clear();
    districtController.clear();
    // DocumentReference documentReference =
    // FirebaseFirestore.instance.collection("employees").doc(_name);
    //
    // Map<String, dynamic> students = {
    //   "name": _name,
    //   "age": _phoneNo,
    //
    // };
    //
    // documentReference.set(students).whenComplete(() {
    //   print("$_name created");
    // });
    //print('$_name $_phoneNo');
    // final _student=EmployeeModal(name: _name, age: _phoneNo);
    // addStudent(_student);

  }
  addData(String employeeName, employeePhoneNo, employeeDistrict, employeeProfession) async{
     this.employee=employeeName;
    Map<String,dynamic> demoData = {
      "Name": employeeName,
      "PhoneNo":employeePhoneNo,
      "District": employeeDistrict,
      "Profession": employeeProfession,
    };
    _CollectionReference.doc(employeeName).set(demoData)
        .whenComplete(() => Fluttertoast.showToast(msg: "User Added"))
        .onError((error, stackTrace) => Fluttertoast.showToast(msg: error.toString()));
    // Navigator.pushNamed(context, EmployeeDashboard.id);
     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmployeeDashboard(employeeName),));
  }


}