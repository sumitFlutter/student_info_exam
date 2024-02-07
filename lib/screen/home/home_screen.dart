import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_info/model/student_model.dart';
import 'package:student_info/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? path="assets/logo image/logo.png";
  TextEditingController txtName=TextEditingController();
  TextEditingController txtGrid=TextEditingController();
  TextEditingController txtS=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle:true,title: const Text("Student's Data",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              studentModel.length != 0 ? Expanded(
                  child: ListView.builder(itemBuilder: (context, index) =>
                     Container(
                        height: 150, width: 150, color: Colors.black12,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(radius: 50,
                          backgroundImage: FileImage(File(studentModel[index].image!))),
                          Column(
                            children: [
                              Text(studentModel[index].name!,style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Text(studentModel[index].grId!,style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Text(studentModel[index].std!,style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          IconButton(onPressed: () {
                            setState(() {
                              studentModel.removeAt(index);
                            });
                          }, icon: Icon(Icons.delete))
                        ],
                      ),),
                    itemCount: studentModel.length,)) :
             const Center(
                child:  Text("Nothing is here tap to + Button to add data",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (context)
        {
          return AlertDialog(
            content: Container(width: MediaQuery
                .sizeOf(context)
                .width, margin: const EdgeInsets.all(15),
            child:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Center(child: Text("Student's Details Add Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      path=="assets/logo image/logo.png"?
                      const CircleAvatar(
                        radius: 70,
                      ): CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(File(path!)),
                      ),
                      Align(
                          alignment: const Alignment(0.35, 0.35),
                          child: IconButton(
                            onPressed: () async{
                              ImagePicker picker=ImagePicker();
                              XFile? image = await picker.pickImage(source: ImageSource.camera);
                              setState(() {
                                path=image!.path;
                              });
              
                            },
                            icon: const Icon(
                              Icons.add_a_photo_rounded,
                              color: Colors.black,
                              weight: 50,
                            ),
                          ))
                    ],
                  ),
                  const Text("Name:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  TextField(
                    controller: txtName,
                    decoration: const InputDecoration(hintText: "Enter Your name"),
                  ),
                  SizedBox(height: 5,),
                  const Text("GR Id:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  TextField(
                    controller: txtGrid,
                    decoration: const InputDecoration(hintText: "Enter Your Grid"),
                  ),
                  SizedBox(height: 5,),
                  const Text("Standard",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  TextField(
                    controller: txtS,
                    decoration: const InputDecoration(hintText: "Enter Your Standard"),
                  ),
                  Center(
                    child: ElevatedButton(onPressed: () {
                    setState(() {
                      studentInfo.add({"name":txtName.text,"GR Id":txtGrid.text,"image":path,"standard":txtS.text});
                      use();
                      txtName.clear();
                      txtS.clear();
                      txtGrid.clear();
                      Navigator.pop(context);
                    });
                    }, child: Text("Submit",style: TextStyle(fontWeight: FontWeight.bold),)),
                  )
                ],
              ),
            ),),
          );
        });}, child: const Icon(Icons.add),),
    ));
  }
}
