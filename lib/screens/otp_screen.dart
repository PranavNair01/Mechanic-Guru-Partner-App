import 'package:flutter/material.dart';
import 'package:code_fields/code_fields.dart';
import 'package:mg_partner_app/screens/main_screen.dart';

class OTPScreen extends StatefulWidget {
  static const String id = '/otp';
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Request OTP',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 45.0,),
          CodeFields(
            fieldWidth: 50.0,
            length: 6,
            inputDecoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),

              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: Colors.transparent)
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            onCompleted: (value){
              Navigator.pushNamed(context, MainScreen.id);
              print(value);
            },
            onChanged: (value){
              print(value);
            },
          ),
          SizedBox(height: 25.0,),
          ElevatedButton(
            child: Text(
              'Resend OTP / Change Mobile Number',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: (){
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFFF56D00)),
            ),
          ),
        ],
      ),
    );
  }
}
