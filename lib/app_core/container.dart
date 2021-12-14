import 'package:flutter/material.dart';

import '../main.dart';
import 'all_drinks.dart';
import 'all_stats.dart';
import 'own_stats.dart';


class buildContainer extends StatefulWidget {
  final String restorationId;
  final String user_name;

  const buildContainer({
    required Key key,
    required this.restorationId,
    required this.user_name,
  }): super(key: key);



  @override
  State<StatefulWidget> createState() {
    return _DrawerState(user_name);
  }
}

class _DrawerState extends State<buildContainer> with RestorationMixin{
  String user_name = "";
final RestorableInt _currentIndex = RestorableInt(0);
  _DrawerState(String user_name){
    this.user_name = user_name;
  }
  @override
  Widget build(BuildContext context) {
    final drawerElements = ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName : Text(user_name),
            accountEmail : Text("Mega cool"),
            currentAccountPicture: const CircleAvatar(),
          ),
          ListTile(title: Text("Alle Drinks"),),
          ListTile(title: Text("Deine Statistik"),),
          ListTile(title: Text("Alle Statistiken"),),
        ]
    );
    var bottomNavBarItems = [
      BottomNavigationBarItem(icon: const Icon(Icons.coffee_outlined), label: "Alle Drinks"),
      BottomNavigationBarItem(icon: const Icon(Icons.align_vertical_bottom), label: "Deine Stats"),
      BottomNavigationBarItem(icon: const Icon(Icons.analytics_rounded), label: "Gesamtstatistik"),
    ];


    return  Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: [
            PopupMenuButton(
              padding: EdgeInsets.zero,
              onSelected: (value) => switchPopupMenuPressed(value.toString(), context),
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: "Teilen",
                  child: ListTile(
                    leading: const Icon(Icons.share),
                    title: Text("Teilen"),
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  value: "Logout",
                  child: ListTile(
                    leading: const Icon(Icons.logout),
                    title: Text("Logout"),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: InkWell(
            onTap: (){

            },
            child: Center(
              child: _BottomNavView(
                key: UniqueKey(),
                item: bottomNavBarItems[_currentIndex.value],
                 user_name: user_name,
              ),
            ),
          )
        ),
        drawer: Drawer(
          child: drawerElements,
        ),
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            items: bottomNavBarItems,
            currentIndex: _currentIndex.value,
            onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          }
          );
        },
        ),

    );
  }

  @override
  String get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }


}

class _BottomNavView extends StatelessWidget{
  final BottomNavigationBarItem item;
  final String user_name;
  _BottomNavView({required Key key, required this.item, required this.user_name}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    Widget currentWidget = allDrinks(user_name);
    switch(item.label.toString()){
      case "Alle Drinks": currentWidget = allDrinks(user_name);
        break;
      case "Gesamtstatistik": currentWidget = allStats(user_name);
        break;
      case "Deine Stats": currentWidget = ownStats(user_name);
        break;
    }
    return currentWidget;
  }

}

void logoutPressed(BuildContext context){
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (BuildContext context) {
      return MainApp();
    }),
  );
}

void switchPopupMenuPressed(String input, BuildContext context){
  switch (input){
    case "Teilen":
      break;

      case "Logout":
        logoutPressed(context);
        break;
  }
}