import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_suite/widgets/components/expandablecard.dart';
import 'package:nano_health_suite/widgets/components/expandablecardpage.dart';
import 'package:provider/provider.dart';

import '../data/snackBarGenerator.dart';
import '../providers/product_provider.dart';
import '../widgets/cached_image_with_placeholder.dart';
import '../widgets/rating_widget.dart';

class ProductDetailsPage extends StatefulWidget{
  final String? productId ;

  const ProductDetailsPage({required this.productId,super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {



  Widget _page() => Stack(
    children: [

       ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child:
            CachedImageWithPlaceholder("https://w0.peakpx.com/wallpaper/582/539/HD-wallpaper-beautiful-nature-view.jpg",BoxFit.cover)
        ),

      Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 15,right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 56,
              width: 55,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)),
                            side: BorderSide(
                                color: Colors.transparent,
                                width: 1)
                        )
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.grey.shade200),
                    elevation: MaterialStateProperty.all(5),
                    shadowColor: MaterialStateProperty.all(Colors.grey.shade800),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    // backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15))
                ),
                onPressed:(){
                   Navigator.pop(context);
                },
                child: ImageIcon(AssetImage("assets/images/back_icon.png",),color: Color(0xff000000),),
              ),
            ),
            SizedBox(
              height: 56,
              width: 55,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)),
                            side: BorderSide(
                                color: Colors.transparent,
                                width: 1)
                        )
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.grey.shade200),
                    elevation: MaterialStateProperty.all(5),
                    shadowColor: MaterialStateProperty.all(Colors.grey.shade800),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    // backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15))
                ),
                onPressed:(){

                },
                child: ImageIcon(AssetImage("assets/images/more_vertical_icon.png",),color: Color(0xff000000),),
              ),
            ),


          ],
        ),
      ),

    ],
  );




  @override
  Widget build(BuildContext context) {

     return
       Scaffold(
         extendBody: true,
         resizeToAvoidBottomInset: false,
         body: ExpandableCardPage(
           page: _page(),
           expandableCard: ExpandableCard(
             backgroundColor: Colors.white,
             padding: EdgeInsets.only(top: 5, left: 10, right: 10),
             maxHeight: MediaQuery.of(context).size.height - 280,
             minHeight: 350,
             hasRoundedCorners: true,
             hasShadow: true,
             hasHandle: true,
             price: 100,
             children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SizedBox(
                     height: 56,
                     width: 55,
                     child: ElevatedButton(
                       style: ButtonStyle(
                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                               const RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(
                                       Radius.circular(20)),
                                   side: BorderSide(
                                       color: Colors.transparent,
                                       width: 1)
                               )
                           ),
                           overlayColor: MaterialStateProperty.all(Colors.grey.shade200),
                           elevation: MaterialStateProperty.all(5),
                           shadowColor: MaterialStateProperty.all(Colors.grey.shade400),
                           backgroundColor: MaterialStateProperty.all(Colors.white),
                           // backgroundColor: MaterialStateProperty.all(Colors.black),
                           foregroundColor: MaterialStateProperty.all(Colors.white),
                           padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                           textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15))
                       ),
                       onPressed:(){

                       },
                       child: ImageIcon(AssetImage("assets/images/share_icon.png",),color: Color(0xff2ab3c6),),
                     ),
                   ),

                   SizedBox(width: 30,),
                   Expanded(
                     child: ElevatedButton(
                       style: ButtonStyle(
                           shape: MaterialStateProperty.all<
                               RoundedRectangleBorder>(
                               const RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(
                                       Radius.circular(25)),
                                   side: BorderSide(
                                       color: Colors.transparent,
                                       width: 1)
                               )
                           ),
                           overlayColor: MaterialStateProperty.all(Colors.white30),
                           elevation: MaterialStateProperty.all(0),
                           shadowColor: MaterialStateProperty.all(Colors.transparent),
                           backgroundColor: MaterialStateProperty.all(Color(0xff2ab3c6)),
                           // backgroundColor: MaterialStateProperty.all(Colors.black),
                           foregroundColor: MaterialStateProperty.all(Colors.white),
                           padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                           textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15))
                       ),
                       onPressed: (){},
                       child: Padding(
                         padding: const EdgeInsets.all(18.0),
                         child: Text('Order Now'),
                       ),
                     ),
                   ),

                 ],
               ),
               const SizedBox(height: 20),
               Align(
                   alignment: Alignment.centerLeft,
                   child: Text("Description",style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic,fontSize: 14),)),
               Align(
                   alignment: Alignment.centerLeft,
                   child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et doloremagna aliqua. Ut enim ad minim veniam, quis nostrudexercitation ullamco laboris nisi ut aliquip ex eacommodo consequat.",style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic,fontSize: 14),)),
               const SizedBox(height: 20),
               Container(
                 decoration: BoxDecoration(
                     color: Colors.grey.shade100,

                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(10),
                       topRight: Radius.circular(10),
                       bottomLeft: Radius.circular(10),
                       bottomRight: Radius.circular(10),
                     )
                 ),
                 child: const Padding(
                   padding:  EdgeInsets.all(8.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,

                     children: [
                       Text("Reviews (100)",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                        Row(
                          children: [
                            Text("4.5",style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),),
                            Expanded(child: RatingWidget(rate: 2.5,))
                          ],
                        )
                     ],
                   ),
                 ),
               ),
               // SizedBox(height: 180),











             ],
           ),
         ),
       );



     //   Scaffold(
     //   body: Column(
     //     children: [
     //
     //       Expanded(child: CachedImageWithPlaceholder("https://www.instyle.com/thmb/VnCyorP_lVyN9A1lwfhne_S3uUU=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/springfashiontrends2-48aefe91808541a2a7bc324e28b2ff76.jpg",BoxFit.cover)),
     //       Theme(
     //         data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
     //         child: Container(
     //           decoration: BoxDecoration(
     //               color: Colors.white,
     //               boxShadow: [
     //                 BoxShadow(
     //                   color: Colors.grey.shade400.withOpacity(0.5),
     //                   spreadRadius: 3,
     //                   blurRadius: 2,
     //                   offset: Offset(0, 3), // changes position of shadow
     //                 ),
     //               ],
     //               borderRadius: BorderRadius.only(
     //                 topLeft: Radius.circular(20),
     //                 topRight: Radius.circular(20),
     //               )
     //           ),
     //           child: ExpansionTile(
     //                 collapsedBackgroundColor: Colors.grey,
     //            childrenPadding: EdgeInsets.zero,
     //             tilePadding: EdgeInsets.only(left: 15),
     //             title: Column(
     //               children: [
     //
     //                 !_customTileExpanded
     //                ? ImageIcon(AssetImage("assets/images/up_icon.png",),color: Color(0xff2ab3c6),)
     //                 :ImageIcon(AssetImage("assets/images/down_icon.png",),color: Color(0xff2ab3c6),),
     //
     //                 Row(
     //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
     //                   children: [
     //                     SizedBox(height: 56,
     //                       width: 55,
     //                       child: ElevatedButton(
     //                         style: ButtonStyle(
     //                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
     //                                 const RoundedRectangleBorder(
     //                                     borderRadius: BorderRadius.all(
     //                                         Radius.circular(20)),
     //                                     side: BorderSide(
     //                                         color: Colors.transparent,
     //                                         width: 1)
     //                                 )
     //                             ),
     //                             overlayColor: MaterialStateProperty.all(Colors.grey.shade200),
     //                             elevation: MaterialStateProperty.all(5),
     //                             shadowColor: MaterialStateProperty.all(Colors.transparent),
     //                             backgroundColor: MaterialStateProperty.all(Colors.white),
     //                             // backgroundColor: MaterialStateProperty.all(Colors.black),
     //                             foregroundColor: MaterialStateProperty.all(Colors.white),
     //                             padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
     //                             textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15))
     //                         ),
     //                         onPressed:(){
     //
     //                         },
     //                         child: ImageIcon(AssetImage("assets/images/share_icon.png",),color: Color(0xff2ab3c6),),
     //                       ),
     //                     ),
     //
     //                      SizedBox(width: 20,),
     //                      Expanded(
     //                        child: ElevatedButton(
     //                           style: ButtonStyle(
     //                               shape: MaterialStateProperty.all<
     //                                   RoundedRectangleBorder>(
     //                                   const RoundedRectangleBorder(
     //                                       borderRadius: BorderRadius.all(
     //                                           Radius.circular(100)),
     //                                       side: BorderSide(
     //                                           color: Colors.transparent,
     //                                           width: 1)
     //                                   )
     //                               ),
     //                               overlayColor: MaterialStateProperty.all(Colors.white30),
     //                               elevation: MaterialStateProperty.all(0),
     //                               shadowColor: MaterialStateProperty.all(Colors.transparent),
     //                               backgroundColor: MaterialStateProperty.all(Color(0xff2ab3c6)),
     //                               // backgroundColor: MaterialStateProperty.all(Colors.black),
     //                               foregroundColor: MaterialStateProperty.all(Colors.white),
     //                               padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
     //                               textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15))
     //                           ),
     //                           onPressed: (){},
     //                           child: Padding(
     //                             padding: const EdgeInsets.all(18.0),
     //                             child: Text('Order Now'),
     //                           ),
     //                         ),
     //                      ),
     //
     //                   ],
     //                 )
     //
     //               ],
     //             ),
     //             // subtitle: const Text('Custom expansion arrow icon'),
     //             trailing: const SizedBox(height: 0,width: 0,),
     //             children: const <Widget>[
     //               ListTile(title: Text('This is tile number 2')),
     //             ],
     //             onExpansionChanged: (bool expanded) {
     //               setState(() {
     //                 _customTileExpanded = expanded;
     //               });
     //             },
     //           ),
     //         ),
     //       ),
     //
     //
     //
     //
     //
     //
     //
     //     ],
     //   ),
     // );
  }


  @override
  void initState() {
    var productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.getProductDetails(widget!.productId!).then((res) {
      if(res.statusCode!=200){
        SnackbarGenerator(context).snackBarGeneratorToast(res.data);
      }
    });

  }

}