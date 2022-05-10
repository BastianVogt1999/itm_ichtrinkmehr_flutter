import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:itm_ichtrinkmehr_flutter/actions_user/timer/timer_main.dart';
import 'package:itm_ichtrinkmehr_flutter/values/company.dart';
import 'package:itm_ichtrinkmehr_flutter/values/statistic.dart';
import 'package:itm_ichtrinkmehr_flutter/values/user.dart';

class DeleteStatements {
  deleteStatistic(Company company, User user, Statistic statistic) {
    var database = FirebaseFirestore.instance.collection(
        '/AllProjects/' + company.company_name + '/StatisticsInProject');

    print(statistic.statistic_id);
    database
        .doc(statistic.statistic_id)
        .delete()
        .catchError((error) => print("Failed to delete Stat: $error"));
  }
}
