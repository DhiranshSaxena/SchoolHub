import 'package:flutter/material.dart';
import 'constants.dart';

//*********** FOR ALL THE DEFAULT BUTTONS ****************
class BasicTextButton extends StatelessWidget {
  final String text;
  final Function onpressed;
  BasicTextButton({@required this.text, @required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onpressed,
      color: Colors.blue,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }
}
//******************** FOR TEXT FIELDS **************
class TextFieldForm extends StatelessWidget {
  final String text;
  final bool obscureText;
  final Function onChanged;
  TextFieldForm({@required this.text,this.obscureText: false,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}
//********************* This is for Message box UI bubble used in chat.dart *******************

class RMessageUI extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;
  RMessageUI({this.text,this.sender,this.isMe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Text('  $sender  ',style: TextStyle(fontSize: 14.0,color: kSecondaryTextColor),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 10.0,
            borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(20.0),bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)) : BorderRadius.only(topRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
            color: isMe ? kAccentColor : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('$text',style: TextStyle(fontSize: 18.0,
                  color: isMe ? Colors.white: Colors.black),),
            ),
          ),
        ),
      ],
    );
  }
}