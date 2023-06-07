import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_suite/models/product_item.dart';
import 'package:nano_health_suite/screens/product_details_page.dart';
import 'package:nano_health_suite/widgets/rating_widget.dart';

import 'cached_image_with_placeholder.dart';

class ProductListItem extends StatefulWidget{
  ProductItem productItem ;
   ProductListItem({required this.productItem,super.key});

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
            MaterialPageRoute(builder: (context) => ProductDetailsPage(productId: widget.productItem.id,)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

           children: [
             Stack(
               alignment: Alignment.bottomCenter,
               children: [
                 ClipRRect(

                     borderRadius: BorderRadius.circular(10.0),
                     child:
                     SizedBox(
                         height: 200,
                         child: CachedImageWithPlaceholder(widget!.productItem!.image!,BoxFit.cover,))
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
                   child:  Row(
                     children: [
                       Text("${widget!.productItem!.price} AED" ,style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),),
                       Expanded(child: RatingWidget(rate: widget!.productItem!.rating!.rate!,))
                     ],
                   ),

                 ),
               ],
             ),
             const SizedBox(height: 10,),
             Align(
                 alignment: Alignment.centerLeft,
                 child: Text(widget.productItem.title!,style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic,fontSize: 14),)),
             Text(widget.productItem.description!,style: TextStyle(color: Colors.black,fontSize: 10)),


           ],
        ),
      ),
    );
  }
}