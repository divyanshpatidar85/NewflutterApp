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
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: Container(
          width: kIsWeb ? MediaQuery.of(context).size.width/2.1:MediaQuery.of(context).size.width,
          child: Center(
            child: ListView(
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
                SizedBox(height: 200,),

                Stack(

                  children: [
                    Center(child: Text("your love percent is ${percent.toStringAsFixed(2)}",style: TextStyle(fontSize: 30,color: Colors.white),)),
                    Container(
                      width:kIsWeb?MediaQuery.of(context).size.width/4.5: MediaQuery.of(context).size.width/1.2,
                      child: Image.asset("assets/images/show.gif"),
                    ),

                    Container(
                      // width:kIsWeb?MediaQuery.of(context).size.width/4.5: MediaQuery.of(context).size.width/1.2,
                      child:
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                        child: Image.asset(
                          "assets/images/show.gif",// Replace with your GIF file path

                        ),
                      ),
                    ),
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
