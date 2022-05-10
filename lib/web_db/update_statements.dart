import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:itm_ichtrinkmehr_flutter/actions_user/timer/timer_main.dart';
import 'package:itm_ichtrinkmehr_flutter/values/company.dart';
import 'package:itm_ichtrinkmehr_flutter/values/statistic.dart';
import 'package:itm_ichtrinkmehr_flutter/values/user.dart';

class UpdateStatements {
  updateStatisticState(Company company, User user, Statistic statistic) {
    print("id: " + statistic.statistic_id);
    var database = FirebaseFirestore.instance.collection(
        '/AllProjects/' + company.company_name + '/StatisticsInProject');

    database.doc(statistic.statistic_id).update(
      {
        'countedTime': statistic.countedTime,
        'endTime': statistic.endTime,
        'isrunning': "false",
      },
    ).catchError((error) => print("Failed to update drink: $error"));
  }
}
