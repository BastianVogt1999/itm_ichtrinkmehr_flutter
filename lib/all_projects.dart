import 'package:flutter/material.dart';

import 'app_core/all_drinks.dart';
import 'app_core/container.dart';

List<String> testProject = [
  "brr",
  "bss",
  "sfda",
  "adsad",
  "saff",
  "dfsdf",
  "ad",
  "adfasd",
  "sads",
  "afssf",
  "sdaf",
  "fsdfi"
];

Widget allProjects(String user_name, BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Angemeldet als: ' + user_name),
      ),
      body: _buildBody(context));
}

void projectPressed(String user_name, BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (BuildContext context) {
      return   MaterialApp(
        home: buildContainer(key: new Key(""), restorationId: "", user_name: user_name)
      );
    }),
  );

}

Widget _buildBody(BuildContext context) {
  return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        return _buildRow(testProject[i ~/ 2], context);
      });
}

Widget _buildRow(String rowName, BuildContext context) {
  return ListTile(
      title: Text(rowName),
      onTap: () {
        projectPressed(rowName, context);
      });
}
