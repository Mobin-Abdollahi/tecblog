import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,16,0,0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              
                  Icon(Icons.menu),
                  Image(
                    image: AssetImage(Assets.images.logo.path),
                    height: size.height/13.6,
                    ),
                  Icon(Icons.search),
              
              ],),
              SizedBox(height: 8,),
              Stack(
                children: [
                  Container(
                  
                    width: size.width/1.25,
                    height: size.height/4.2,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(image: Image(image: AssetImage(Assets.images.posterTest.path),).image,
                    fit: BoxFit.cover
                    )
                    ),

                  ),
                   Container(
                  
                    width: size.width/1.25,
                    height: size.height/4.2,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(
                      colors: gradiantColors.homePosterCoverGradiant,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    )
                    ),

                  )


                ],
              )
            ],
          ),
        ),
        ),
      );

    
  }
}