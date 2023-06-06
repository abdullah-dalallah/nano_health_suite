import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget{
  final double rate ;
  const RatingWidget({required this.rate,super.key});


  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {


  final int starCount = 5;
  @override
  Widget build(BuildContext context) {
    int filledStars = widget.rate.floor();
   double fraction = widget.rate - filledStars;

   return Row(
     mainAxisAlignment: MainAxisAlignment.end,
     children: [
       // Display filled stars
       for (int i = 0; i < filledStars; i++)
         Padding(
           padding: const EdgeInsets.all(2.0),
           child: Image.asset("assets/images/yellow_star_icon.png", ),
         ),
       // Display half-filled star
       if (fraction > 0)
         Padding(
           padding: const EdgeInsets.all(2.0),
           child: Image.asset("assets/images/grey_star_icon.png", ),
         ),
       // Display empty stars
       for (int i = filledStars + 1; i < starCount; i++)
         Padding(
           padding: const EdgeInsets.all(2.0),
           child: Image.asset("assets/images/grey_star_icon.png", color: Colors.grey.shade300,),
         ),
     ],
   );
  }
}