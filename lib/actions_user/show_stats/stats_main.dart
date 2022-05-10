import 'dart:async';
import 'package:flutter/material.dart';
import 'package:itm_ichtrinkmehr_flutter/actions_user/show_stats/popup_edit_stat.dart';
import 'package:itm_ichtrinkmehr_flutter/actions_user/timer/timer_main.dart';
import 'package:itm_ichtrinkmehr_flutter/values/company.dart';
import 'package:itm_ichtrinkmehr_flutter/values/statistic.dart';
import 'package:itm_ichtrinkmehr_flutter/values/user.dart';
import 'package:itm_ichtrinkmehr_flutter/web_db/delete_statements.dart';
import 'package:itm_ichtrinkmehr_flutter/web_db/select_statements.dart';

SelectStatements selectStatements = SelectStatements();
DeleteStatements deleteStatements = DeleteStatements();

class Stats_main extends StatefulWidget {
  final User user;
  final Company company;
  const Stats_main(this.user, this.company, {Key? key}) : super(key: key);

  @override
  State<Stats_main> createState() => _Stats_mainState(user, company);
}

class _Stats_mainState extends State<Stats_main> {
  User user;
  Company company;

  _Stats_mainState(this.user, this.company);

  Widget widgetBuilded = Container();
  updateWidget() {
    setState(() {
      widgetBuilded = widgetBuilded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget CustomListTile(
      User user,
      Company company,
      Statistic statistic,
    ) {
      Color color = const Color(0xFF4338CA);
      return Container(
          height: 80,
          color: Colors.white,
          child: Row(children: [
            SizedBox(
                width: (MediaQuery.of(context).size.width / 10) * 3,
                child: Center(
                    child: Column(children: const [
                  SizedBox(height: 5),
                  Text(
                    "Startzeit: ",
                    textScaleFactor: 1,
                  ),
                  Text(
                    "Stoppzeit: ",
                    textScaleFactor: 1,
                  ),
                  Text(
                    "Zeitspanne: ",
                    textScaleFactor: 1,
                  )
                ]))),
            SizedBox(
                width: (MediaQuery.of(context).size.width / 10) * 2,
                child: Center(
                    child: Column(children: [
                  SizedBox(height: 5),
                  Text(
                    statistic.startTime,
                    textScaleFactor: 1,
                  ),
                  Text(
                    statistic.endTime,
                    textScaleFactor: 1,
                  ),
                  Text(
                    statistic.countedTime,
                    textScaleFactor: 1,
                  )
                ]))),
            SizedBox(
                width: (MediaQuery.of(context).size.width / 10) * 4,
                child: Row(children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber,
                    child: IconButton(
                        color: Colors.black,
                        padding: const EdgeInsets.all(2),
                        iconSize: 20,
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          print("edit");
                        }),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber,
                    child: IconButton(
                        color: Colors.black,
                        padding: const EdgeInsets.all(2),
                        iconSize: 20,
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          deleteStatements.deleteStatistic(
                              company, user, statistic);
                          print("delete");
                          updateWidget();
                        }),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber,
                    child: IconButton(
                        color: Colors.black,
                        padding: const EdgeInsets.all(2),
                        iconSize: 20,
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          showDialog<Dialog>(
                              context: context,
                              builder: (BuildContext context) =>
                                  EditStats(statistic));
                          print("details");
                        }),
                  ),
                ]))
          ]));
    }

    widgetBuilded = FutureBuilder(
      builder: (context, snapshot) {
// Checking if future is resolved
        if (snapshot.connectionState == ConnectionState.done) {
// If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} while getting drinks occured',
                style: TextStyle(fontSize: 18),
              ),
            );

// if we got our data
          } else if (snapshot.hasData) {
// Extracting data from snapshot object
            final data = snapshot.data as List<Statistic>;

            return Scrollbar(
                child: ListView.builder(
                    itemCount: data.length,
                    padding: EdgeInsets.all(5),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.all(5),
                          child: CustomListTile(
                            user,
                            company,
                            data[index],
                          ));
                    }));
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: _getStatsFromServer(
          Company("testCompany 2204", "1234"), User("Dieter", "1234", "false")),
    );

    return widgetBuilded;
  }
}

_getStatsFromServer(
  Company company,
  User user,
) async {
  try {
    List<Statistic> allDrinks =
        await selectStatements.selectStatsOfUserOnDate(user, company);

    return allDrinks;
  } catch (Exception) {
    print("Error while getting Data");
  }
}

deleteStatistic(User user, Statistic statistic, BuildContext context) {}
