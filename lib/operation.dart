import 'package:flutter/material.dart';
import 'package:readfile/search.dart';
import 'package:readfile/showData.dart';

// ignore: must_be_immutable
class Operation extends StatefulWidget {
  late List<String> content;
  Operation(this.content, {Key? key}) : super(key: key);

  @override
  _OperationState createState() => _OperationState(content);
}

class _OperationState extends State<Operation> {
  late List<String> content;
  _OperationState(this.content);
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
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ShowData(content);
                  }));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.visibility,
                      size: 80,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Show data",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Search(data: content);
                  }));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      size: 90,
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 200,
                      child: Text(
                        "Search for order of numbers",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
