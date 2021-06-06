import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/mobile_number_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/main_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/tnc_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context)=>WelcomeScreen(),
        MobileNumberScreen.id: (context)=>MobileNumberScreen(),
        OTPScreen.id: (context)=>OTPScreen(),
        MainScreen.id: (context)=>MainScreen(),
        CategoriesScreen.id: (context)=>CategoriesScreen(),
        TnCScreen.id: (context)=>TnCScreen(),
      },
    );
  }
}

