import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tekblog_application_4/Model/fake_data.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';
import 'package:tekblog_application_4/Model/fake_data.dart';
import 'package:tekblog_application_4/my_strings.dart';
import 'package:tekblog_application_4/view/home_screen.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width/10;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: solidColors.scaffoldBg,
        title: 
           Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.menu,color: Colors.black,),
            Image(
              image: AssetImage(Assets.images.logo.path),
              height: size.height / 13.6,
            ),
            Icon(Icons.search,color: Colors.black),
                
      ],),
      ),
      body: Stack(
        children: [
           homeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
                    height: size.height/10,
                    decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: gradiantColors.buttonNavBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              )
              ),
            child: Padding(
            padding:  EdgeInsets.only(right: bodyMargin, left : bodyMargin),
            child: Container(
              height: size.height/1.8,
              decoration:const BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(18)) ,
                gradient:  LinearGradient(
                colors: gradiantColors.buttonNav,
              )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: (() {}), 
                    icon: ImageIcon(AssetImage(Assets.icons.homeIcon.path),color: Colors.white,)),
                  IconButton(
                    onPressed: (() {}), 
                    icon: ImageIcon(AssetImage(Assets.icons.featherIcon.path),color: Colors.white,)),
                  IconButton(
                    onPressed: (() {}), 
                    icon: ImageIcon(AssetImage(Assets.icons.userIcon.path),color: Colors.white,)),
                ],
              ),
            ),
                    ),
                  ),
          ),
        ],
        
      ),
      );

    
  }
}

