 

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lovepredictorapp/resource.dart';
import 'package:lovepredictorapp/showResult.dart';

double  percent=0.0;

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


  final malenameTextEditingController = TextEditingController();
  final maledatelTextEditingController = TextEditingController();
  final femaleTextEditingController = TextEditingController();
  final femaledateTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final _formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,

        body: Center(
          child: Container(
            width: kIsWeb ? MediaQuery.of(context).size.width/2.1:MediaQuery.of(context).size.width,
            child: ListView(
              // padding: EdgeInsets.all(10),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width:kIsWeb?MediaQuery.of(context).size.width/4.5: MediaQuery.of(context).size.width/2,
                      child: Image.asset("assets/images/lo.gif"),
                    ),

                    Container(
                      width:kIsWeb?MediaQuery.of(context).size.width/4.5: MediaQuery.of(context).size.width/2,
                      child: Image.asset("assets/images/lo.gif"),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40,20,40,20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key:_formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: "Male",
                                hintStyle: TextStyle(color: Colors.white,fontSize: 20),
                                filled: true,
                                fillColor:Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none
                                    )
                                ),
                                prefixIcon: Icon(Icons.person,color:Colors.amber.shade400,),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (text){
                                if(text==null || text.isEmpty){
                                  return 'Name can\'t be empty';
                                }
                                if(text.length<2){
                                  return 'Please Enter a valid Name';
                                }
                                if(text.length>49){
                                  return 'Name can\'t be greater than 50';
                                }
                              },
                              onChanged: (text)=>setState(() {
                                malenameTextEditingController.text =text;

                              }),
                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: maledatelTextEditingController,
                              readOnly: true,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: "Male DOB",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ),
                                filled: true,
                                fillColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none
                                    )
                                ),
                                prefixIcon: Icon(Icons.date_range,color:Colors.amber.shade400),
                              ),
                              onTap: ()async{
                                DateTime? datepicker = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2050),
                                );
                                var date = "${datepicker?.day} - ${datepicker?.month} - ${datepicker?.year}";
                                print(date);
                                maledatelTextEditingController.text = date;


                              },
                            ),
                            Image.asset("assets/images/love.png",width: 150,),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: "Female",
                                hintStyle: TextStyle(color: Colors.white,fontSize: 20),
                                filled: true,
                                fillColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none
                                    )
                                ),
                                prefixIcon:  Icon(Icons.person,color: Colors.amber.shade400,),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (text){
                                if(text==null || text.isEmpty){
                                  return 'Name can\'t be empty';
                                }
                                if(text.length<2){
                                  return 'Please Enter a valid Name';
                                }
                                if(text.length>49){
                                  return 'Name can\'t be greater than 50';
                                }
                              },
                              onChanged: (text)=>setState(() {
                                femaleTextEditingController.text =text;
                              }),
                            ),SizedBox(height: 15,),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: femaledateTextEditingController,
                              readOnly: true,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: "Female DOB",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ),
                                filled: true,
                                fillColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none
                                    )
                                ),
                                prefixIcon: Icon(Icons.date_range,color:Colors.amber.shade400),
                              ),
                              onTap: ()async{
                                DateTime? datepicker = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2050),
                                );
                                var date = "${datepicker?.day} - ${datepicker?.month} - ${datepicker?.year}";
                                print(date);
                                femaledateTextEditingController.text = date;


                              },
                            ),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.amber.shade400,
                                  onPrimary:Colors.black ,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),

                                  ),
                                  minimumSize: Size(double.infinity, 50)

                              ),
                              onPressed: ()async{
                                percent= await FireStoreMethods().AddData(malenameTextEditingController.text.trim().toLowerCase(),femaleTextEditingController.text.trim().toLowerCase(),maledatelTextEditingController.text.trim().toLowerCase(),femaledateTextEditingController.text.trim().toLowerCase());
                                  malenameTextEditingController.text='';
                                  femaleTextEditingController.text='';
                                  maledatelTextEditingController.text='Male DOB';
                                  femaledateTextEditingController.text='Female DOB';
                                  print('${percent}');
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>showResult()));

                              }, child: Text("Submit"),


                            )


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );

  }

}

// ElevatedButton(onPressed:() async{
//
// percent= await FireStoreMethods().AddData(first.text.toLowerCase(),second.text.toLowerCase(),firstpersondob,secondpersondob);
// first.text='';
// second.text='';
// firstpersondob='dd/mm/yyyy';
// secondpersondob='dd/mm/yyyy';
// print('${percent}');
// setState(() {
//
// });
// }, child:const Text('Submit')
