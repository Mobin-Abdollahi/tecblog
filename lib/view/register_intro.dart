import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tekblog_application_4/gen/assets.gen.dart';
import 'package:tekblog_application_4/my_colors.dart';
import 'package:tekblog_application_4/my_strings.dart';

class RegisterIntro extends StatelessWidget{
  const RegisterIntro({super.key});


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
                onPressed: () {

                  showModalBottomSheet(
                    isScrollControlled:true ,
                    context: context,
                    backgroundColor: Colors.transparent,
                     builder: ((context){

                      return Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: size.height/2,
                        
                          decoration:const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)
                            )
                        
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(MyStrings.insertYourEmail,style: textTheme.titleMedium,),
                        
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "techblog@gmail.com",
                                      hintStyle: textTheme.titleLarge
                                      ),
                                  
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){}, 
                                  child: Text("ادامه"))
                              ],
                            ),
                        
                          ),
                        ),
                      );

                     })
                     );

                },
                 child :const Text("بزن بریم"),
                
                 
                 ),
              )

            ],
          ),
        
        ),

      )
      
      );

  }
}