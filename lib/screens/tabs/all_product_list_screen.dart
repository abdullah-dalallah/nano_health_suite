import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_suite/data/snackBarGenerator.dart';
import 'package:nano_health_suite/providers/product_provider.dart';
import 'package:nano_health_suite/widgets/base_appbar_with_logo.dart';
import 'package:nano_health_suite/widgets/product_list_item.dart';
import 'package:provider/provider.dart';

class AllProductListScreen extends StatefulWidget{
  @override
  State<AllProductListScreen> createState() => _AllProductListScreenState();
}

class _AllProductListScreenState extends State<AllProductListScreen> {




  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  BaseAppnbar(context,"All Products").createBaseAppbar(),
     body: Column(
       children: [
     Consumer<ProductProvider>(
     builder: (context, productProvider, child) {
       return
         Expanded(
           child: ListView.separated(
             padding: EdgeInsets.only(top: 20),
             itemCount: productProvider.allProducts.length,
             itemBuilder: (context, index){
               return
                 //Container();

                 ProductListItem(productItem: productProvider.allProducts[index],);
           },
           separatorBuilder:(context, index)=>Padding(
             padding: const EdgeInsets.only(left: 18.0, bottom: 10, top: 18 , right: 18),
             child: Divider(),
           ) ,

           ),
         );

   })
       ],
     ),

   );
  }

  @override
  void initState() {
    var productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.getAllProducts().then((res) {
      if(res.statusCode!=200){
        SnackbarGenerator(context).snackBarGeneratorToast(res.data);
      }
    });

  }
}