import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lpchub/feedback.dart';

class crudMethods{
  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser != null)
      {
        return true;
      }else{
      return false;
    }
  }

  /*Future<void> addData(suggestions) async{
    if(isLoggedIn()){
      FirebaseFirestore.instance.collection('Feedbacks').add(suggestions).catchError((e){
        print(e);
      });
    }else{
      print('You need to be logged in');
    }
  }*/

  addData(feed){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('Feedbacks');
    collectionReference.add(feed);
  }
}