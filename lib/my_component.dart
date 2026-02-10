import 'package:flutter/material.dart';
import 'package:tekblog_application_4/Model/fake_data.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color:SolidColors.dividerColor ,
      indent: size.width/6,
      endIndent: size.width/6,
      );
  }
}

class MainTags extends StatelessWidget {
   MainTags({
    super.key,
    required this.index,
    required this.textTheme,
  });

  final TextTheme textTheme;
  var index;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration:const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
          colors: GradiantColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft
          ),
           
           
      ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16,8,8,8),
      child: Row(
        children: [
           
        ImageIcon(AssetImage(Assets.icons.hashtagicon.path),
        color: Colors.white,
        size: 16,),
        SizedBox(width: 8,),
        Text(tagList[index].title,style: textTheme.headlineSmall,)
           
      ],),
    ),
           
    );
  }
}