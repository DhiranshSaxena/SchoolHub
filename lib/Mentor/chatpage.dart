import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lpchub/Mentor/constants.dart';
import 'package:lpchub/Mentor/home.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String msg;
  User loggedInUser;
  final messageTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      } else {
        print('no user found');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff104976),
        leading: null,
        title: Text('DISCUSSION BOX', style: TextStyle(
          fontFamily: 'MeriendaOne'
        ),),

      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('Messages').snapshots(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(backgroundColor: kLightPrimaryColor,),
                  );
                }
                final messages = snapshot.data.docs.reversed;
                List<RMessageUI> messageWidgets = [];
                for(var msg in messages){
                  final messageText = msg.data()['text'];
                  final messageSender = msg.data()['sender'];
                  final currentUser = loggedInUser.email;
                  final messageWidget = RMessageUI(text: messageText,sender: messageSender,isMe: currentUser == messageSender);
                  messageWidgets.add(messageWidget);
                }
                return Expanded(
                  child: ListView(
                    children: messageWidgets,
                    reverse: true,
                  ),
                );
              },
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20,),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: messageTextController,
                      onChanged: (value) {
                        msg = value;
                      },
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('Messages').add({
                        'text': msg,
                        'sender': loggedInUser.email
                      });
                    },
                    child: Icon(
                      Icons.send,
                      color: Color(0xff104976),

                    )),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}