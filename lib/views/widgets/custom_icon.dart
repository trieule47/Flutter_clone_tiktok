import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        width: 45,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 38,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 50, 0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 38,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 25, 45, 221),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                width: 40,
                height: 30,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 238, 234, 233),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.add, color: Colors.black,),
              ),
            )
          ],
        ));
  }
}
