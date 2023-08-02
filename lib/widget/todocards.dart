import 'package:flutter/material.dart';
class todocards extends StatelessWidget {
  
String vartitle;
bool doneORnot;
Function myfun;
int iii;
Function delete;
todocards({required this.vartitle,required this.doneORnot,required this.myfun,required this.iii,required this.delete,});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
myfun(iii);
      },
    
    child:  FractionallySizedBox(
      widthFactor: 0.9,child:

       Container(
       
         margin: EdgeInsets.only(top: 20),
       
         padding: EdgeInsets.all(10),
       
         
       
         decoration: BoxDecoration(color: const Color.fromARGB(255, 91, 91, 91),
       
         borderRadius: BorderRadius.circular(17)),
       
         child:Row(
       
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
        children: [
       
       Text(
       vartitle
          ,style: TextStyle(
            color:doneORnot? Colors.black: Colors.white,
            fontSize: 22,
            decoration: doneORnot?TextDecoration.lineThrough:TextDecoration.none),),
       
          Row(
            children: [
              Icon(
                doneORnot?Icons.check:Icons.close
                
                ,size:30,
                color:doneORnot?Colors.green : Colors.red,),
                SizedBox(width: 15,),
                IconButton(onPressed: (){
                  delete(iii);
                }, icon: Icon(Icons.delete),
                iconSize: 27,
                color:Color.fromARGB(255, 181, 88, 82)
                
                )
            ],
          )
       
        ],
       
         )
        
       ),
       
        
        
    )
         
     );
  }
}