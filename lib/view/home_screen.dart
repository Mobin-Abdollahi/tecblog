import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tekblog_application_4/Model/fake_data.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';
import 'package:tekblog_application_4/my_strings.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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

           homePagePoster(size: size, textTheme: textTheme),
          const SizedBox(height: 16,),
              
           homePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(height: 32,),

           SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),

           homePageBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
           const SizedBox(height: 32,),
        
           seeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
          
           homePagePodcastList(size: size, bodyMargin: bodyMargin),
         
          const SizedBox(height: 60,)
         ],
       ),
     ),
     ),
            );
  }
}

class homePagePodcastList extends StatelessWidget {
  const homePagePodcastList({
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
       
      
    );
  }
}

class seeMorePodcast extends StatelessWidget {
  const seeMorePodcast({
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
          ImageIcon(AssetImage(Assets.icons.microphoneIcon.path),color: solidColors.seeMore,),
          SizedBox(width: 8,),
          Text(MyStrings.viewHotestBlog,style: textTheme.headlineLarge,)
        ],),
    );
  }
}

class homePageBlogList extends StatelessWidget {
  const homePageBlogList({
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
          ImageIcon(AssetImage(Assets.icons.pencilIcon.path),color: solidColors.seeMore,),
          SizedBox(width: 8,),
          Text(MyStrings.viewHotestBlog,style: textTheme.headlineLarge,)
        ],),
    );
  }
}

class homePageTagList extends StatelessWidget {
  const homePageTagList({
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
    );
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
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
    );
  }
}