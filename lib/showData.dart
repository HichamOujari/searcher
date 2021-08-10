import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowData extends StatelessWidget {
  late List<String> data;

  ShowData(this.data, {Key? key}) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.join("\n").toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
