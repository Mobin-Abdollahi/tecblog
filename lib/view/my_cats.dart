import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_strings.dart';

class MyCats extends StatelessWidget {
  const MyCats({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width/10;

    return SafeArea(
      child:Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32,),
                  SvgPicture.asset(Assets.images.techbot.path,height: 100,),
                  SizedBox(height: 16,),
                  Text(MyStrings.successfulRegisteration,style: textTheme.titleMedium,),
            
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.titleMedium
                      ),
                  ),
                  SizedBox(height: 32,),
                  Text(MyStrings.chooseCats,style: textTheme.titleMedium,),

                ],
              ),
            ),
          ),
        ),
      ) 
    
    );
  }
}