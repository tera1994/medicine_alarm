import 'package:flutter/material.dart';
import 'ad_banner.dart';
import 'chackbox_model.dart';
import 'checkbox_repository.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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

  String getCurrentDate() {
    var dateTimeSplited = DateTime.now().toString().split(" ");
    return dateTimeSplited[0];
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
        Text(
          getCurrentDate(),
          style: TextStyle(fontSize: 25),
        ),
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
        SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 0, 255, 213), //ボタンの背景色
            ),
            onPressed: () {
              setState(() {
                _checkboxModel[0].isCheck = false;
                _checkboxModel[1].isCheck = false;
                _checkboxModel[2].isCheck = false;
                _checkboxRepository.saveCheckData(_checkboxModel[0].isCheck,
                    _checkboxModel[1].isCheck, _checkboxModel[2].isCheck);
              });
            },
            child: Text(
              'Clear',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        AdBanner(size: AdSize.largeBanner),
      ],
    ));
  }
}
