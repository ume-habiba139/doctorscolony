import 'package:flutter/material.dart';
class DrJahanzaib extends StatelessWidget {
  const DrJahanzaib({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan ,

        title: Text('Go Back',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),

      body: Padding(
      padding: EdgeInsets.only(top: 40),
      child:
      Image.asset('images/img_3.png'),
      )
    );
  }
}
