import 'package:flutter/material.dart';
import 'chackbox_model.dart';

class CheckBoxList extends StatefulWidget {
  CheckBoxList({Key? key}) : super(key: key);

  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  bool _value1 = true;
  List<CheckBoxModel> checkbox_model = [];
  @override
  void initState() {
    checkbox_model = <CheckBoxModel>[
      CheckBoxModel(title: "Morning", isCheck: false),
      CheckBoxModel(title: "Afternoon", isCheck: true),
      CheckBoxModel(title: "Night", isCheck: true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(DateTime.now().toString()),
        Expanded(
          child: ListView.builder(
              itemCount: checkbox_model.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      CheckboxListTile(
                          activeColor: Colors.pink[300],
                          title: Text(checkbox_model[index].title),
                          value: checkbox_model[index].isCheck,
                          onChanged: (bool? val) {
                            setState(() {
                              checkbox_model[index].isCheck = val!;
                            });
                          }),
                    ],
                  ),
                );
              }),
        )
      ],
    ));
  }
}
