import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget
{
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 150,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<
                    RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(100)),
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
            onPressed: (){

            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('Log out'),
            ),
          ),
        ),
      ),
    );
  }
}