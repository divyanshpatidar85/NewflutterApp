 

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lovepredictorapp/resource.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
   
   if(kIsWeb){

 await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC5AxQhPBeQDE8VvsvWVVtoucxvK7eIzbc",
            appId: "1:791970927131:web:298964ab521bb6f8d69ebe",
            messagingSenderId: "791970927131",
            storageBucket: "lovepredictorapp.appspot.com",
            
            projectId: "lovepredictorapp"
            )
            );
   }else{
      await Firebase.initializeApp();
   }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lovers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   String  firstpersondob='dd/mm/yyyy',secondpersondob='dd/mm/yyyy';
    final TextEditingController first=TextEditingController();
final TextEditingController second=TextEditingController();
  DateTime ? dob1,dob2;
  double  percent=0.0;
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body:Center(
        child:SizedBox(
          height:MediaQuery.of(context).size.height*0.5,
          width:MediaQuery.of(context).size.width*0.8 ,
          child:   Column(
            children: [
              TextField(
                keyboardType:TextInputType.text,
                controller:first,
                decoration:const InputDecoration(
                  label:Text('Enter Your Name'),
                   focusedBorder:OutlineInputBorder()
                ),
                
              ),
              
            
              SizedBox(height:MediaQuery.of(context).size.height*0.02,),
              
              InkWell
              (
                child: Text('$firstpersondob'),
                onTap:() async{
                  dob1= await showDatePicker(
                  context:context,
                  initialDate:DateTime.now(),
                  lastDate:DateTime.now(),
                  firstDate:DateTime(1952),
                  );
                 
                  // dob1=dob1?.day as DateTime?;
                  if(dob1!=null){
                  firstpersondob = DateFormat('dd/MM/yyyy').format(dob1!);
                  // secondpersondob = DateFormat('dd/MM/yyyy').format(dob2!);
                    setState(() {
                      
                    });
                  }
                }
              ),
              
            
           SizedBox(height:MediaQuery.of(context).size.height*0.02,),
              TextField(
                keyboardType:TextInputType.text,
                controller:second,
                decoration:const InputDecoration(
                  label:Text('Enter Your Partner Name'),
                  // border:OutlineInputBorder(),
                  focusedBorder:OutlineInputBorder()
                  
                ),
                
              ),
               SizedBox(height:MediaQuery.of(context).size.height*0.02,),
               InkWell
              (
                child: Text('$secondpersondob'),
                onTap:() async{
                  dob2= await showDatePicker(
                  context:context,
                  initialDate:DateTime.now(),
                  lastDate:DateTime.now(),
                  firstDate:DateTime(1952),
                  );
                 
                  // dob1=dob1?.day as DateTime?;
                  if(dob2!=null){
                  secondpersondob = DateFormat('dd/MM/yyyy').format(dob2!);
                  
                    
                    Duration dob3=dob1!.difference(dob2!);
                    double a=dob3.inDays/365;
                    if(a<0){
                      a=-a;
                    }
                     print('helllo    ${a}     dob3 in days ${dob3.inDays}');
                    setState(() {
                      
                    });
                  }
                }
              ),
              ElevatedButton(onPressed:() async{
            
               percent= await FireStoreMethods().AddData(first.text.toLowerCase(),second.text.toLowerCase(),firstpersondob,secondpersondob);
              first.text='';
              second.text='';
              firstpersondob='dd/mm/yyyy';
              secondpersondob='dd/mm/yyyy';
              print('${percent}');
              setState(() {
                
              });
              }, child:const Text('Submit')
              ),
              percent!=0?Text('Your Love percent is :${percent}'):Text('')
            ],
          ),
        ),
      )
       
    );
  }
}

class AddData {
}
