import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Builder Example"),
      ),
      body: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: LayoutBuilder(
            builder: (context, constraints ){
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;
              return Column(
    children: [
      Text("Width layar adalah $width dan height layar adalah $height"),
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
    width: width * 0.7,
    child: ElevatedButton(
    onPressed: () {}, child: Text("Buttn 70% width"))),
    ],
    );
    },
      ),
    ));
  }
}
