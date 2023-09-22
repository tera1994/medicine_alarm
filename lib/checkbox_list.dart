import 'package:flutter/material.dart';
import 'chackbox_model.dart';
import 'checkbox_repository.dart';

class CheckBoxList extends StatefulWidget {
  CheckBoxList({Key? key}) : super(key: key);

  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  final List<CheckBoxModel> _checkboxModel = [];
  final CheckBoxRepository _checkboxRepository = CheckBoxRepository();

  void initCheckBoxModel() async {
    var checkData = await _checkboxRepository.getCheckData();
    setState(() {
      _checkboxModel
          .add(CheckBoxModel(title: "Morning", isCheck: checkData["morning"]!));
      _checkboxModel.add(
          CheckBoxModel(title: "Afternoon", isCheck: checkData["afternoon"]!));
      _checkboxModel
          .add(CheckBoxModel(title: "Night", isCheck: checkData["night"]!));
    });
  }

  void initState() {
    initCheckBoxModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(DateTime.now().toString()),
        Expanded(
          child: ListView.builder(
              itemCount: _checkboxModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      CheckboxListTile(
                          activeColor: Colors.pink[300],
                          title: Text(_checkboxModel[index].title),
                          value: _checkboxModel[index].isCheck,
                          onChanged: (bool? val) {
                            setState(() {
                              _checkboxModel[index].isCheck = val!;
                              _checkboxRepository.saveCheckData(
                                  _checkboxModel[0].isCheck,
                                  _checkboxModel[1].isCheck,
                                  _checkboxModel[2].isCheck);
                            });
                          }),
                    ],
                  ),
                );
              }),
        ),
      ],
    ));
  }
}
