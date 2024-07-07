import 'dart:math';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('please select your profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          Container(
            height: 100,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(border:Border.all(color: Colors.black)),
            child:const Row(
              
              children: [
                Radio(value: 0, groupValue: null, onChanged: null),
                Icon(Icons.house_rounded,size: 40,),
                SizedBox(width: 10,),
                Text('Shipper',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
            // color: Colors.red,
          ),
        const SizedBox(height: 18,),
          Container(
           
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),

             child:  const Row(
              children: [
                Radio(value: 0, groupValue: null, onChanged: null),
                Icon(Icons.bus_alert_sharp,size: 40,),
                SizedBox(width: 10,),
                Text('Transporter',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              
              ],
            ),
            

           
          ),
         Container(
          height: 40,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: ElevatedButton(onPressed: (){}, child: Text("Continue"),
          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 30, 2, 132)),
          )
          )
        ],
      ),
    );
  }
}