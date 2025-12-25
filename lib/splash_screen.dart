import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/Model/main_screen.dart';
import 'package:tekblog_application_4/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
  class _SplashScreenState extends State<SplashScreen> {
    
  @override
  void initState() {

    Future.delayed(Duration(seconds: 3)).then((value){

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context)=> MainScreen()
        ));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
            Image(image: AssetImage(Assets.images.logo.path),height: 64,),
            SizedBox(height: 32,),
             SpinKitFadingCube(
             color: solidColors.primaryColor,
              size: 32.0,
            )
          
          ],),
        ),
      ),

    );
  }
}