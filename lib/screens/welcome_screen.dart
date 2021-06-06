import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'mobile_number_screen.dart';
import 'dart:io' show Platform;

class WelcomeScreen extends StatefulWidget {
  static const String id = '/1';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  
  String selectedLanguage = 'English';
  
  Widget getPicker(){
    if(Platform.isAndroid)
      return DropdownButton<String>(
          value: selectedLanguage,
          items: [
            DropdownMenuItem(child: Text('English'), value: 'English',),
            DropdownMenuItem(child: Text('हिन्दी'), value: 'हिन्दी',),
          ],
          onChanged: (value){
            setState(() {
              selectedLanguage = value;
              print(selectedLanguage);
            });
        },
      );
    else if(Platform.isIOS)
      return CupertinoPicker(
          itemExtent: 32.0,
          onSelectedItemChanged: (value){
            selectedLanguage = (value==0)?'English':'हिन्दी';
            print(selectedLanguage);
          },
          children: [
            Text('English'),
            Text('हिन्दी'),
          ],
      );
  }
  
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 30.0,
    );

    controller.forward();

    controller.addListener(() {setState(() {

    }
    );
    }
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage('images/logo.jpeg'),
                  height: 120.0,
                ),
              ),
              Text(
                'Mechanic Guru',
                style: TextStyle(
                  fontSize: controller.value,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          getPicker(),
          SizedBox(
            height: 25.0,
          ),
          FloatingActionButton(
              onPressed: (){
                Navigator.pushNamed(context, MobileNumberScreen.id);
              },
              backgroundColor: Color(0xFFF56D00),
              child: Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
              ),
              ),
        ],
      ),
    );
  }
}
