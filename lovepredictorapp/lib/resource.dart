import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<double> AddData(
      String firstname, String secondname,String dob1,String dob2) async {
    double returnval=0;
    try {
      String uid = const Uuid().v1();
      var intValuee = Random().nextDouble(); // Value is >= 0 and < 10.
      intValuee = Random().nextDouble()*50+50; 


      QuerySnapshot snapshot = await _firestore
          .collection('Data')
          .where('firstName', isEqualTo: firstname).where('secondname',isEqualTo:secondname).where('dob1',isEqualTo:dob1).where('dob2',isEqualTo:dob2)
          .get();
      QuerySnapshot snapshot1 = await _firestore
          .collection('Data')
          .where('secondname', isEqualTo: firstname).where('firstName',isEqualTo:secondname).where('dob1',isEqualTo:dob2).where('dob2',isEqualTo:dob1)
          .get();


      if (snapshot.docs.isNotEmpty || snapshot1.docs.isNotEmpty) {

       if(snapshot.docs.isNotEmpty){
        print('first one 11');
         QueryDocumentSnapshot doc = snapshot.docs[0];
          print('first one ');
         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          intValuee = data['lovepercentage'];
           print('first one ${intValuee}');
       
       }else{
        print('second one');
         QueryDocumentSnapshot doc = snapshot1.docs[0];
         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          intValuee = data['lovepercentage'];
          print('s one ${intValuee}');

       }
       
      } else {
        

        await _firestore.collection('Data').doc(uid).set(
          {'firstName':firstname,
            'secondname':secondname,
            'dob1':dob1,
            'dob2':dob2,
            'lovepercentage':intValuee
          }
      
        );
      }
      print('love value ${intValuee}');
        returnval=intValuee;
      
    }catch(err){
      String codeerr=err.toString();
      print('error occur');
    }
    return returnval;
  }
}
    