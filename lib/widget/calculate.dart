import 'package:flutter/material.dart';
class calculate extends StatelessWidget {
  
int allCompleted;
int alltodo;

calculate({super.key, required this.allCompleted,required this.alltodo});
  @override
  Widget build(BuildContext context) {
    return 

     Padding(padding:const EdgeInsets.only(top: 27),
           child:

       Text("$allCompleted/$alltodo" ,
      style:TextStyle(
   color: allCompleted==alltodo? Colors.green:Colors.white,fontSize: 44,fontWeight: FontWeight.bold,),
   ),
       
          );
 
 
  }
}