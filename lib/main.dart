

import 'package:flutter/material.dart';
import 'package:to_do_app/widget/calculate.dart';
import 'package:to_do_app/widget/todocards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key?key}):super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     home:ToDoApp(),
     debugShowCheckedModeBanner: false,
    );
  }
}
class ToDoApp extends StatefulWidget {
  const     ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}
//class for task (to do cards)
class Task{
  String title;
  bool status;
  Task({required this.title,required this.status});

}



class _ToDoAppState extends State<ToDoApp> {
  //list of to do
List alltask = [
Task(title:"publish video",status:true),
Task(title:"Gym",status:true),

];
//to remove all to do when clicking on "delete" icon
deleteall(){
setState(() {
  
    alltask.removeRange(0, alltask.length);
  
  
});
}
//to remove to do when clicking on "delete " icon 
delete(int clicktask){
setState(() {
  alltask.remove(alltask[clicktask]);
});


}
//to change the state of the to do (completed or not completed) when click on the to do
changestatus( int taskindex){
  setState(() {
    alltask[taskindex].status=!alltask[taskindex].status;
  });
  
}
//to add new todo when clicking on "add" in the diolog widget
myfunc(){
    setState(() {
      
    
    alltask.add(Task(title:myController.text,status: false ),);
  });}
 //create controller to get the text inside the textfield 
  final myController = TextEditingController();
  //to calculate only completed todo
int calculateCompletedTask(){
int completeTask=0;
alltask.forEach((element) {
  if(element.status==true){
    completeTask++;
  }
  

});
return completeTask;
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
floatingActionButton: FloatingActionButton(onPressed: (){

  showDialog(context: context, builder: (BuildContext context) {
    return Dialog(child:Container(
    height:200,
    
    padding: EdgeInsets.all(22),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

      TextField(controller:myController ,
        maxLength: 20,
        decoration: InputDecoration(
          labelText: "Add new task"
        ),
      ),
      SizedBox(height: 22,),
TextButton(onPressed: (){
  Navigator.pop(context);myfunc();
}, child: Text("Add",style: TextStyle(fontSize: 17),))
    ]),
    )
    );

  },
  
  );
},
child: Icon(Icons.add),
backgroundColor: Colors.orange[300],
),
      backgroundColor: Color.fromARGB(124, 42, 88, 157),
      appBar: AppBar(
        actions: [
          IconButton(onPressed:(){deleteall();}, icon: Icon(Icons.delete_forever),
          iconSize: 36,
          color: Color.fromARGB(255, 144, 25, 17),
          )
        ],
        backgroundColor: const Color.fromARGB(255, 92, 136, 173),
        title: Text("TO DO App", style:TextStyle(fontWeight:FontWeight.bold,fontSize: 27 ),),
        ),
body:
  SizedBox(
  width: double.infinity,
       child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          calculate(
allCompleted:calculateCompletedTask(),
alltodo:alltask.length
          ),
   
   Container(
    height: 500,
    child:
ListView.builder(
  itemCount: alltask.length,
  itemBuilder: ( BuildContext context , int index ){


    return todocards(
      //i will pass all these information when create the todocards() widget in todocards class 
      vartitle:alltask[index].title,
      doneORnot:alltask[index].status,
      myfun:changestatus,
      iii:index,
      delete:delete,
    );
  }),
        
   )
        
  
        ],
  ),
  ),
    );
  }
}