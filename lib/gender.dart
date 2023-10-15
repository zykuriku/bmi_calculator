import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  Gender({required this.iconn, required this.t});
  final IconData iconn;
  final String t;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconn,
          size: 40.0,
          // color: Colors.,
        ),
        // SizedBox(
        //   height: 10.0,
        // ),
        Center(
          child: Text(
            t,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
