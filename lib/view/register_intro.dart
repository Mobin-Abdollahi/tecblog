import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';
import 'package:tekblog_application_4/my_strings.dart';

class RegisterIntro extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    
    return SafeArea(
      child: Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             SvgPicture.asset((Assets.images.techbot.path), height: 100,),
             Padding(
               padding: EdgeInsets.only(top: 16),

               child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                text: MyStrings.welcome,
                style: textTheme.titleMedium

               )),
             ),

              Padding(
                padding: EdgeInsets.only(top: 32),
                child: ElevatedButton(
                onPressed: () {},
                 child : Text("بزن بریم"),
                 style: ButtonStyle(
                  textStyle: MaterialStateProperty.resolveWith((states){
                
                    if (states.contains(MaterialState.pressed)) {
                      return textTheme.headlineMedium;
                    }
                      return textTheme.titleSmall;
                
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states){
                
                    if (states.contains(MaterialState.pressed)) {
                      return solidColors.seeMore;
                    }
                      return solidColors.primaryColor;
                
                  }),
                 ),
                 
                 ),
              )

            ],
          ),
        
        ),

      )
      
      );

  }
}