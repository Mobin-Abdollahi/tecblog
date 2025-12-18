import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';
import 'package:tekblog_application_4/splash_screen.dart';
void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    
    statusBarColor: solidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: solidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark
    
     ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
         //rastchin shod
        localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('fa'), // farsi

  ],
      theme: ThemeData(
        fontFamily: 'B Mitra',
        textTheme: TextTheme(

          headlineMedium:TextStyle(
            fontFamily: 'B Mitra',
            fontSize: 20,
            fontWeight: FontWeight.w700
             ),

             bodyMedium:TextStyle(
            fontFamily: 'B Mitra',
            fontSize: 16,
            fontWeight: FontWeight.w500
             ) ,

             headlineSmall:TextStyle(
            fontFamily: 'B Mitra',
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500
             ),

             headlineLarge:TextStyle(
            fontFamily: 'B Mitra',
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.w700
             ),

             titleMedium:TextStyle(
            fontFamily: 'B Mitra',
            fontSize: 16,
            color: Colors.green,
            fontWeight: FontWeight.w700
             )   

        )
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

