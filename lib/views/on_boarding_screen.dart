import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mawaqit_android_tv/view_model/on_boarding_view_model.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget with ChangeNotifier{
  String id='';

  @override
  Widget build(BuildContext context) {

    return Consumer<OnBoardingViewModel>(
        builder: (context,onBoardingViewModel,child){

          return Scaffold(

            body: Stack(

                children:[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    constraints:const BoxConstraints.expand(),
                    decoration:const  BoxDecoration(
                        image: DecorationImage(
                            image:  AssetImage('images/mawaqit-aurora-night-sky 1.png',),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                  Center(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 75.0),
                      shrinkWrap: true,
                      children: [
                        Column(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                            Image.asset('images/Logo 2022.png'),
                            const SizedBox(height: 17.0,),
                            Text('WELCOME TO',style:Theme.of(context).textTheme.headline1),
                            Text ('MAWAQIT',style: Theme.of(context).textTheme.headline6),
                          ]
                        ),

                        const SizedBox(height: 22.0,),

                        Provider.of<OnBoardingViewModel>(context,listen: false).isOk==false?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 163.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 74.0,vertical: 20.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    Text(
                                      'Mawaqit offers you a new way to track and manage prayer times, indeed we offer an end-to-end, system that provides mosque managers with an online tool available 24/24h.',

                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF).withOpacity(0.6),
                                        fontSize: 33.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFFFFFFFF),
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
                                        fixedSize: const Size(150.0,53.26),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27.0)),
                                      ),
                                        onPressed: (){
                                        Provider.of<OnBoardingViewModel>(context,listen: false).getIdBlock()==true;
                                    },
                                        child: const Text('OK',style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.w700,color: Color(0xFF490094)),))
                                  ]
                              ),

                          ),
                        ):
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 163.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 74.0,vertical: 20.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:   CrossAxisAlignment.start,
                                children:[
                                  Text(
                                    'Please enter your mosque ID below :',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF).withOpacity(0.6),
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 35.0,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Expanded(
                                       flex: 6,
                                       child: Container(
                                         padding:const EdgeInsets.symmetric(horizontal: 28.0,vertical: 2.0),
                                         decoration: BoxDecoration(
                                           color: const Color(0xFFFFFFFF),
                                           borderRadius: BorderRadius.circular(25.0),
                                         ),
                                         child: TextField(
                                           inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.digitsOnly ],
                                           keyboardType: TextInputType.number,
                                           style: TextStyle(
                                             fontWeight: FontWeight.w400,
                                             fontSize: 24.0,
                                             color: Theme.of(context).primaryColor,
                                           ),
                                           decoration: InputDecoration(
                                             hintText: 'Mosque ID (Example: 256)',
                                             hintStyle: TextStyle(
                                               fontWeight: FontWeight.w400,
                                               fontSize: 24.0,
                                               color: Theme.of(context).primaryColor.withOpacity(0.3),
                                             ),
                                           ),
                                           onChanged: (value){
                                             id=value;
                                           },
                                         ),
                                       ),
                                     ),
                                     const SizedBox(width: 11.0,),
                                     Expanded(
                                       flex: 1,
                                       child: ElevatedButton(

                                           style: ElevatedButton.styleFrom(
                                             primary: const Color(0xFFFFFFFF),
                                             padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
                                             fixedSize: const Size(150.0,53.26),
                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27.0)),
                                           ),
                                           onPressed: ()async{

                                            if(id!='') {
                                              await Provider.of<
                                                  OnBoardingViewModel>(
                                                  context, listen: false)
                                                  .getInformationById(id);
                                            }
                                           }, child: const Text('OK',style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.w700,color: Color(0xFF490094)),)),
                                     )
                                   ],
                                 ),


                                ]
                            ),

                          ),
                        )

                      ],
                    ),
                  ),
                ]
            ),
          );}
    );
  }
}
