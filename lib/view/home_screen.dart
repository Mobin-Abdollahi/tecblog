import 'package:flutter/material.dart';
import 'package:tekblog_application_4/Model/fake_data.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';
import 'package:tekblog_application_4/my_component.dart';
import 'package:tekblog_application_4/my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
     child: Padding(
       padding: const EdgeInsets.fromLTRB(0,16,0,0),
       child: Column(
         //appbar
         children: [

           HomePagePoster(size: size, textTheme: textTheme),
          const SizedBox(height: 16,),
              
           HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(height: 32,),

           SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),

           HomePageBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
           const SizedBox(height: 32,),
        
           SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
          
           HomePagePodcastList(size: size, bodyMargin: bodyMargin),
         
          const SizedBox(height: 60,)
         ],
       ),
     ),
     ),
            );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                        colors: GradiantColors.blogPost)
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
       
      
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(AssetImage(Assets.icons.microphoneIcon.path),color: SolidColors.seeMore,),
          SizedBox(width: 8,),
          Text(MyStrings.viewHotestBlog,style: textTheme.headlineLarge,)
        ],),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                        colors: GradiantColors.blogPost)
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
       
      
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(AssetImage(Assets.icons.pencilIcon.path),color: SolidColors.seeMore,),
          SizedBox(width: 8,),
          Text(MyStrings.viewHotestBlog,style: textTheme.headlineLarge,)
        ],),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: ((context , index){
        
        return Padding(
          padding: EdgeInsets.fromLTRB(0,8,index==0 ? bodyMargin : 15,8),
          child: MainTags(textTheme: textTheme, index: index,),
        );
      
      })),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            colors: GradiantColors.homePosterCoverGradiant,
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
    );
  }
}