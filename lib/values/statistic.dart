class Statistic {
  String statistic_id;
  String user_name;
  String startTime;
  String endTime;
  String countedTime;
  String date;
  String isrunning;

  Statistic(this.statistic_id, this.user_name, this.startTime, this.endTime,
      this.countedTime, this.date, this.isrunning);

  Statistic.empty() : this("", "", "", "", "", "", "");
}

class UserAsMap {
  UserAsMap(
      {required this.statistic_id,
      required this.user_name,
      required this.startTime,
      required this.endTime,
      required this.countedTime,
      required this.date,
      required this.isrunning});

  UserAsMap.fromJson(Map<String, Object> json)
      : this(
          statistic_id: json['statistic_id'] as String,
          user_name: json['user_name'] as String,
          startTime: json['startTime'] as String,
          endTime: json['endTime'] as String,
          countedTime: json['countedTime'] as String,
          date: json['date'] as String,
          isrunning: json['isrunning'] as String,
        );

  final String statistic_id;
  final String user_name;
  String startTime;
  String endTime;
  String countedTime;
  String date;
  String isrunning;

  Map<String, Object> toJson() {
    return {
      'statistic_id': statistic_id,
      'user_name': user_name,
      'startTime': startTime,
      'endTime': endTime,
      'countedTime': countedTime,
      'date': date,
      'isrunning': isrunning,
    };
  }
}

class UpdateableStatistic {
  int index;
  Statistic updateableStatistic;
  UpdateableStatistic(this.index, this.updateableStatistic);

  UpdateableStatistic.empty() : this(0, Statistic.empty());
}
