import 'package:flutter/material.dart';
import 'package:get/get.dart';
class YourWidget extends StatefulWidget {
  @override
  State<YourWidget> createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.teal,
      title:Text("ANNONCEMENT",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: (){},
      ),
    ),
     body:  ListView.builder(

       physics: NeverScrollableScrollPhysics(),
       shrinkWrap: true,
       itemCount: 4,
       itemBuilder: (context, index) {
         return Padding(
           padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20, top: 10),
           child: GestureDetector(
             onTap: () {
               // Get.toNamed(RouteHelper.getreccomendedFood(index));
             },
             child: Container(
               width: double.maxFinite,
               height: Dimensions.height145,
               child: Row(
                 children: [
                   Container(
                     height: Dimensions.height135,
                     width: Dimensions.width110,
                     decoration: BoxDecoration(color: Colors.greenAccent,
                       // image: DecorationImage(
                       //   image: AssetImage(
                       //     // AppConstants.MAIN_URL +
                       //     //     AppConstants.UPLOAD_URL +
                       //     //     recommendedproducts.recommendedProductList[index].img!,
                       //   ),
                       //   fit: BoxFit.cover,
                       // ),
                       borderRadius: BorderRadius.only(bottomRight:  Radius.circular(35),topRight: Radius.circular(35) ,
                         topLeft: Radius.circular(35),
                         bottomLeft: Radius.circular(35),
                       ),
                     ),
                     child: SingleChildScrollView(
                       child: Padding(
                         padding: const EdgeInsets.all(6.0),
                         child: Column(children: [
                           Padding(
                             padding: const EdgeInsets.all(13.0),
                             child: Text("Today \n 9:AM",style:TextStyle(fontSize: 25,
                               color: Colors.black,
                             ),),
                           )
                         ]),
                       ),
                     ),
                   ),
                   SizedBox(width: Dimensions.width5),
                   Expanded(
                     child: Container(
                       height: Dimensions.height135,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(bottomRight:  Radius.circular(35),topRight: Radius.circular(35) ,
                           topLeft: Radius.circular(35),
                           bottomLeft: Radius.circular(35),
                         ),
                         border: Border.all(width: .5, color: Colors.black12),
                         color: Colors.white,
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 13),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SizedBox(height: Dimensions.height13,),
                             Text(
                               "Artificial Intelligence\nclass",
                               style: TextStyle(fontSize: Dimensions.font20),
                             ),
                             SizedBox(height: Dimensions.height10),
                             Row(
                               children: [
                                 Icon(Icons.location_on, color: Colors.blueGrey),
                                 Text(
                                   "SMCC BUILDING",
                                   style: TextStyle(color: Colors.teal, fontSize:15,fontWeight: FontWeight.bold),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
         );
       },
     ),
    );
  }
}
class Dimensions {
  static double height145 = 145;
  static double height135 = 135;
  static double width110 = 110;
  static double width5 = 5;
  static double height13 = 13;
  static double font20 = 20;
  static double height8 = 8;
  static double font13 = 13;
  static double height10 = 10;
}
