import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tekblog_application_4/Model/fake_data.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';
import 'package:tekblog_application_4/Model/fake_data.dart';
import 'package:tekblog_application_4/my_strings.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width/10;

    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,16,0,0),
            child: Column(
              //appbar
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
               const SizedBox(height: 8,),
               // poster
                Stack(
                  children: [
                    Container(
                    
                      width: size.width/1.25,
                      height: size.height/4.2,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(image: AssetImage(homePagePosterMap["imageAsset"]),
                      fit: BoxFit.cover
                      )
                      ),
        
                      foregroundDecoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                        colors: gradiantColors.homePosterCoverGradiant,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                      )
                      ),
                    ),
                  
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Text(homePagePosterMap["writer"]+" - "+homePagePosterMap["date"],style: textTheme.titleSmall),
                          Row(
                            children: [
                              Text(homePagePosterMap["view"],style: textTheme.titleSmall,),
                             const SizedBox(width: 8,),
                             const Icon(Icons.remove_red_eye_sharp, color: Colors.white,size: 16,),
                            ],
                          )
                        ],),
                      
                          Text("دوازده قدم برنامه نویسی . یک دوره ی...س",style: textTheme.headlineMedium,)
                      ],),
                    )
        
                  ],
                ),
        
                //taglist
               const SizedBox(height: 16,),
        
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tagList.length,
                    itemBuilder: ((context , index){
                    
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0,8,index==0 ? bodyMargin : 15,8),
                      child: Container(
                        height: 60,
                        decoration:const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          gradient: LinearGradient(
                            colors: gradiantColors.tags,
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
        
                      ),
                    );
                  
                  })),
                ),
               const SizedBox(height: 32,),
              //seeMore
                Padding(
                  padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                  child: Row(
                    children: [
                      ImageIcon(AssetImage(Assets.icons.pencilIcon.path),color: solidColors.seeMore,),
                      SizedBox(width: 8,),
                      Text(MyStrings.viewHotestBlog,style: textTheme.headlineLarge,)
                    ],),
                ),
                //blog list
                SizedBox(
                  height: size.height/3.5,
                  child: ListView.builder(
                    itemCount: blogList.getRange(0, 5).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index){
                    // blog item
                    return Padding(
                      padding: EdgeInsets.only(right:index==0 ? bodyMargin : 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: size.height/5.3,
                                width: size.width/2.4,
                              child: Stack(
                                children: [
                                   Container(
                                 decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  image: DecorationImage(
                                    image: NetworkImage(blogList[index].imageUrl),
                                    fit: BoxFit.cover
                                
                                    ),
                                 ),
                                 foregroundDecoration:const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: gradiantColors.blogPost)
                                 ),
                                ),
                                Positioned(
                              bottom: 8,
                              left: 0,
                              right: 0,
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Text(blogList[index].writer,style: textTheme.titleSmall),
                              Row(
                                children: [
                                  Text(blogList[index].view,style: textTheme.titleSmall,),
                                 const SizedBox(width: 8,),
                                 const Icon(Icons.remove_red_eye_sharp, color: Colors.white,size: 16,),
                                ],
                              )
                               ],),
                                )
                                ],
                              ),
                            ),
                          ),
                        SizedBox(
                          width: size.width/2.4,
                          child: 
                        
                        Text(
                          blogList[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          )
                        )
                        ],
                      ),
                    );
                  }),
        
                  
                ),
                const SizedBox(height: 32,),
              //seeMore
                Padding(
                  padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                  child: Row(
                    children: [
                      ImageIcon(AssetImage(Assets.icons.microfonIcon.path),color: solidColors.seeMore,),
                      SizedBox(width: 8,),
                      Text(MyStrings.viewHotestBlog,style: textTheme.headlineLarge,)
                    ],),
                ),
                //blog list
                SizedBox(
                  height: size.height/3.5,
                  child: ListView.builder(
                    itemCount: blogList.getRange(0, 5).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index){
                    // blog item
                    return Padding(
                      padding: EdgeInsets.only(right:index==0 ? bodyMargin : 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: size.height/5.3,
                                width: size.width/2.4,
                              child: Stack(
                                children: [
                                   Container(
                                 decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  image: DecorationImage(
                                    image: NetworkImage(blogList[index].writerImageUrl),
                                    fit: BoxFit.cover
                                
                                    ),
                                 ),
                                 foregroundDecoration:const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: gradiantColors.blogPost)
                                 ),
                                ),
                                ],
                              ),
                            ),
                          ),
                        SizedBox(
                          width: size.width/2.4,
                          child: 
                        
                        Text(
                          blogList[index].content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          )
                        )
                        ],
                      ),
                    );
                  }),
        
                  
                )
              ],
            ),
          ),
          ),
      ),
      );

    
  }
}