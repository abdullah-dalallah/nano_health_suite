import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_suite/screens/product_details_page.dart';
import 'package:nano_health_suite/widgets/rating_widget.dart';

import 'cached_image_with_placeholder.dart';

class ProductListItem extends StatefulWidget{
  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailsPage(productId: "1",)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Stack(
               alignment: Alignment.bottomCenter,
               children: [
                 ClipRRect(
                     borderRadius: BorderRadius.circular(10.0),
                     child:
                     CachedImageWithPlaceholder("https://www.instyle.com/thmb/VnCyorP_lVyN9A1lwfhne_S3uUU=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/springfashiontrends2-48aefe91808541a2a7bc324e28b2ff76.jpg",BoxFit.cover)
                 ),
                 Container(
                   padding: EdgeInsets.only(top: 32,bottom: 10,left: 10, right: 10),
                   decoration: const BoxDecoration(
                   borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(10),
                   bottomRight: Radius.circular(10),
                   ),
                     gradient: LinearGradient(
                       begin: Alignment.bottomCenter,
                       end: Alignment.topCenter,
                       colors: [Color(0xCC000000), Colors.transparent],
                     ),
                   ),
                   child: const Row(
                     children: [
                       Text("00000 AED" ,style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),),
                       Expanded(child: RatingWidget(rate: 2.5,))
                     ],
                   ),

                 ),
               ],
             ),
             SizedBox(height: 10,),
             Align(
                 alignment: Alignment.centerLeft,
                 child: Text("product name",style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic,fontSize: 14),)),
             Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod"
                 "tempor incididunt ut labore et dolore magna",style: TextStyle(color: Colors.black,fontSize: 10)),
             // SizedBox(height: 15,),
             // Padding(
             //   padding: const EdgeInsets.all(2.0),
             //   child: Divider(),
             // ),

           ],
        ),
      ),
    );
  }
}