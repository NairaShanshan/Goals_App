import 'package:flutter/material.dart';

class NoGoalWidget extends StatelessWidget {
  const NoGoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.indigo[100],
          child:const  Icon(Icons.flag_outlined , size: 50, color: Colors.indigo,),
        ) ,
        const SizedBox(height: 20,),
        Text('No Goals Yet ' ,
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 30 ,
          fontWeight: FontWeight.bold ,
          color: Colors.grey[700]
        ),),
        const SizedBox(height: 20,),
        Text('Tap the + button to add your first goal ' ,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20 ,
            color: Colors.grey[500]
        ),),
      ],
    );
  }
}
