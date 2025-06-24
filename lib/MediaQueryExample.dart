import 'package:flutter/material.dart';

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Media Query Example"),
      ),
      body : Column(
        children: [
          Text("Width Layar adalah $width dan height layar adalah $height"),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {}, child: Text("Default Button"))),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
              width: width,
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Button full width"))),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
              width: width,
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Buttn 70% width"))),
        ],
      ),
    );
  }
}
