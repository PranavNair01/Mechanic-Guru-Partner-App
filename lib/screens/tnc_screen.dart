import 'package:flutter/material.dart';

class TnCScreen extends StatelessWidget {
  static const String id = '/tnc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text(
          'Back',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text(
            'Terms and Conditions',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),
          ),
        ],
      ),

    );
  }
}
