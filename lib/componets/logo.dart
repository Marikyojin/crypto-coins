import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 323,
        child: Center(
          child: Container(
            color: Color(0xFF000d2d),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text(
                    "CRYPTO",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE2A50E)
                    ),
                    )],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(
                    "coins",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFFE2A50E)
                    ),
                    )],
                  ),
                Image.asset("images/logo.jpg"),
              ],
            ),
          ),
        ),
    );
  }
}