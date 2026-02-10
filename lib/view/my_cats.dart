import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tekblog_application_4/Model/data_models.dart';
import 'package:tekblog_application_4/Model/fake_data.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';
import 'package:tekblog_application_4/my_component.dart';
import 'package:tekblog_application_4/my_strings.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
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
                  // taglist
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3
                        
                        ), 
                        itemBuilder: ((context, index){
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedTags.add(tagList[index]);
                              });
                            },
                            child: MainTags(index: index, textTheme: textTheme));
                        })
                        ),
                    ),
                  ), 
                  const SizedBox(height: 16,),
                  Image.asset((Assets.images.downArrow.path),scale: 1,color: Colors.black,),

                  //selectedtags
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.2
                        
                        ), 
                        itemBuilder: ((context, index){
                          return Container(

                            height: 60,
                            decoration:const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                              color: SolidColors.surface
                                
                                
                            ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16,8,8,8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                              SizedBox(width: 8,),
                              Text(selectedTags[index].title,style: textTheme.titleMedium,),
                              InkWell(
                                onTap: ((){
                                  setState(() {
                                    selectedTags.removeAt(index);
                                  });
                                }),
                                child: const Icon(CupertinoIcons.delete ,color: Colors.grey, size: 20,)),
                                
                            ],),
                          ),
                                
                          );
                        })
                        ),
                    ),
                  ), 
                ],
              ),
            ),
          ),
        ),
      ) 
    
    );
  }
}