import 'package:flutter/material.dart';
import 'package:mg_partner_app/screens/main_screen.dart';
import 'package:mg_partner_app/screens/otp_screen.dart';

class MobileNumberScreen extends StatefulWidget {
  static const String id = '/mobile';
  @override
  _MobileNumberScreenState createState() => _MobileNumberScreenState();
}

String mobileNumberWithCode;
String mobileNumber;

class _MobileNumberScreenState extends State<MobileNumberScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Go Back',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter mobile number',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.phone,
              style: TextStyle(
                color: Colors.black,
                //fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                icon: Icon(
                  Icons.phone,
                  color: Color(0xFFF56D00),
                  size: 45.0,
                ),
                hintText: '10 digit number',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Raleway',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xFFF56D00),
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              onChanged: (value){
                mobileNumberWithCode='+91'+value;
                mobileNumber=value;
                print(mobileNumberWithCode);
              },
              maxLength: 10,
            ),
          ),
          ElevatedButton(
            child: Text(
              'REQUEST OTP',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, OTPScreen.id);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFFF56D00)),
            ),
          ),
          ElevatedButton(
            child: Text(
              'Continue as Guest',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, MainScreen.id);
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
