import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tekblog_application_4/Model/fake_data.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';
import 'package:tekblog_application_4/my_component.dart';
import 'package:tekblog_application_4/my_strings.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     physics:const BouncingScrollPhysics(),
      child: SafeArea(
     child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(Assets.images.avatar.path),height: 100,),
        const SizedBox(height: 12,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ImageIcon(AssetImage(Assets.icons.pencilIcon.path), color: solidColors.seeMore,),
          SizedBox(width: 8,),
          Text(
            MyStrings.imageProfileEdit,
            style: textTheme.headlineLarge,
          )
        ],),

        const SizedBox(height: 60,),
        Text("مبین عبدالهی", style: textTheme.titleMedium,),
        Text("abdollahimobin95@gmail.com", style: textTheme.titleMedium,),
        const SizedBox(height: 40,),
        techDivider(size: size),
        InkWell(
          onTap: () {
            
          },
          splashColor: solidColors.primaryColor,
          child: SizedBox(
            height: 45,
            child: Center(child: Text(MyStrings.myFavBlog,style: textTheme.titleMedium,))),
        ),
        techDivider(size: size),
        InkWell(
          onTap: () {
            
          },
          splashColor: solidColors.primaryColor,
          child: SizedBox(
            height: 45,
            child: Center(child: Text(MyStrings.myFavPodCast,style: textTheme.titleMedium,))),
        ),
        techDivider(size: size),
        InkWell(
          onTap: () {
            
          },
          splashColor: solidColors.primaryColor,
          child: SizedBox(
            height: 45,
            child: Center(child: Text(MyStrings.logOut,style: textTheme.titleMedium,))),
        ),
        const SizedBox(height: 60,),
     ],
     )
     ),
    );
  }
}



