import 'package:flutter/material.dart';
import 'package:pertemuan3/AppBarExample1.dart';
import 'package:pertemuan3/ColumnExample.dart';
import 'package:pertemuan3/ContainerExample1.dart';
import 'package:pertemuan3/ContainerExample2.dart';
import 'package:pertemuan3/ImageAssetExample.dart';
import 'package:pertemuan3/MediaQueryExample.dart';
import 'package:pertemuan3/ScaffoldExample.dart';
import 'package:pertemuan3/TextFieldExample.dart';
import 'package:pertemuan3/MediaQueryExample.dart';
import 'package:pertemuan3/LayoutBuilderExample.dart';
import 'package:pertemuan3/StatefulExample.dart';
import 'package:pertemuan3/HalamanSatu.dart';
import 'package:pertemuan3/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
    );
  }
}


