import 'package:flutter/material.dart';

class SpleshScreen_ extends StatefulWidget {
  const SpleshScreen_({super.key});

  @override
  State<SpleshScreen_> createState() => _SpleshState();
}

class _SpleshState extends State<SpleshScreen_> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, "home"),);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/logo image/logo.png",height: 120,width: 120,fit: BoxFit.cover,)),
          const SizedBox(height: 5,),
          const Center(child: Text("Student_Info",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),)
        ],
      ),
    ),);
  }
}
