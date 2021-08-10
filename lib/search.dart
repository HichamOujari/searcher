import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Search extends StatefulWidget {
  late List<String> data;
  Search({required this.data, Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState(data: data);
}

class _SearchState extends State<Search> {
  late List<String> data;
  List<TextEditingController> listInput = [];
  List<int> rslt = [];
  _SearchState({required this.data});

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Result of searching :"),
      content: Text("The numbers are not found."),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController inputCount = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Search numbers"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height - 119,
          width: size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                child: TextField(
                  onSubmitted: (e) {
                    if (inputCount.text.length != 0) {
                      int count = int.parse(inputCount.text);
                      setState(() {
                        listInput = [];
                        rslt = [];
                        for (int i = 0; i < count; i++) {
                          listInput.add(new TextEditingController());
                        }
                      });
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: inputCount,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Icon(Icons.nature)),
                    hintText: "Tape count of numbers",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              listInput.length == 0
                  ? Container()
                  : Expanded(
                      child: Container(
                        width: size.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: 10,
                        ),
                        child: ListView(
                          children: [
                            for (var i in listInput)
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(2, 2),
                                        blurRadius: 8,
                                      ),
                                    ]),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: i,
                                  decoration: InputDecoration(
                                    hintText:
                                        "Enter ${listInput.indexOf(i) + 1}th number",
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
              listInput.length == 0
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        var isExist = 0;
                        for (var j = 0; j < data.length; j++) {
                          isExist = 0;
                          for (var item in listInput) {
                            print("-->" + item.text);
                            if (data[j].contains(item.text)) isExist++;
                          }
                          if (isExist == listInput.length) rslt.add(j + 1);
                        }
                        if (rslt.length == 0) showAlertDialog(context);
                        setState(() {
                          listInput = [];
                        });
                      },
                      child: Container(
                        height: 40,
                        width: size.width,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05, vertical: 15),
                        color: Colors.green,
                        child: Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
              rslt.length == 0
                  ? Container()
                  : Expanded(
                      child: Container(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Available in order :",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              rslt.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
