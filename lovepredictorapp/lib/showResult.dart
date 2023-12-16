import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lovepredictorapp/main.dart';


class showResult extends StatefulWidget {
  const showResult({super.key});

  @override
  State<showResult> createState() => _showResultState();
}

class _showResultState extends State<showResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          // width: kIsWeb ? MediaQuery.of(context).size.width/2.1:MediaQuery.of(context).size.width,
           width:(MediaQuery.of(context).size.width<MediaQuery.of(context).size.height)?MediaQuery.of(context).size.width:MediaQuery.of(context).size.width*0.78,
          child: Center(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                  height:(MediaQuery.of(context).size.width<MediaQuery.of(context).size.height)?MediaQuery.of(context).size.height*0.4 :MediaQuery.of(context).size.height*0.5,
                  width:(MediaQuery.of(context).size.width<MediaQuery.of(context).size.height)?MediaQuery.of(context).size.width:MediaQuery.of(context).size.width*0.78,
                      child: Image.asset("assets/images/lovegif.webp",
                      fit:BoxFit.contain,
                      ),
                      
                    ),

                    // Container(
                    //   width:kIsWeb?MediaQuery.of(context).size.width/4.5: MediaQuery.of(context).size.width/2,
                    //   child: Image.asset("assets/images/lovegif.webp"),
                    // ),
                  ],
                ),
                // SizedBox(height: 200,),
                Center(
                  child: RichText(text: TextSpan(
                    children:[
                    const  TextSpan(
                   text:'Love ',
                   style:TextStyle(color:Colors.white)
                      ),
                      const  TextSpan(
                   text:'meter ',
                   style:TextStyle(color:Colors.white)
                      ),
                    const    TextSpan(
                   text:'at ',
                   style:TextStyle(color:Colors.white)
                      ),
                         TextSpan(
                   text:'${percent.toStringAsFixed(2)} ',
                   style:const TextStyle(color:Colors.white)
                      ),
                       const TextSpan(
                   text:', but',
                   style:TextStyle(color:Colors.white)
                      ),
                      const  TextSpan(
                   text:' commitment ',
                   style:TextStyle(color:Colors.white)
                      ),
                    const  TextSpan(
                   text:' level',
                   style:TextStyle(color:Colors.white)
                      ),
                    const  TextSpan(
                   text:' at',
                   style:TextStyle(color:Colors.white)
                      ),
                    const  TextSpan(
                   text:' a',
                   style:TextStyle(color:Colors.white)
                      ),
                    const  TextSpan(
                   text:' solid',
                   style:TextStyle(color:Colors.white)
                      ),
                    const   TextSpan(
                   text:' 100%',
                   style:TextStyle(color:Colors.white)
                      ),
                    ]
                  )),
                ),
 SizedBox(height:MediaQuery.of(context).size.height*0.04,),
                Stack(

                  children: [
                      Center(
                        child: Container(
                        // width:kIsWeb?MediaQuery.of(context).size.width/4.5: MediaQuery.of(context).size.width/1.2,
                        child:
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                          child: Image.asset(
                            "assets/images/firecarackers.webp",// Replace with your GIF file path
                        
                          ),
                        ),
                                            ),
                      ),
                    // Center(child: Text("your love percent is ${percent.toStringAsFixed(2)}",style: TextStyle(fontSize: 30,color: Colors.white),)),
                    

                  
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
