import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:readfile/operation.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _read() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path.toString());
      print(result.files.single.path.toString());
      try {
        var content = await file.readAsLines();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Operation(content);
        }));
      } catch (e) {
        print(e);
      }
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Order"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height - 119,
          width: size.width,
          child: GestureDetector(
            onTap: () {
              _read();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.file_copy,
                  size: 100,
                ),
                SizedBox(height: 20),
                Text(
                  "Choose your file",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
