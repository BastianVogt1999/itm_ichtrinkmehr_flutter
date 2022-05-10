import 'package:flutter/material.dart';
import 'package:itm_ichtrinkmehr_flutter/actions_admin/UserManagement/user_operations/add_user.dart';
import 'package:itm_ichtrinkmehr_flutter/actions_admin/UserManagement/user_operations/admin_right.dart';
import 'package:itm_ichtrinkmehr_flutter/actions_admin/UserManagement/user_operations/delete_user.dart';
import 'package:itm_ichtrinkmehr_flutter/values/company.dart';

class CompanyStocks {
  String name;
  double price;
  IconData icon;
  Widget dialog;

  CompanyStocks(
      {required this.name,
      required this.price,
      required this.icon,
      required this.dialog});
}

class UserOperations extends StatefulWidget {
  Company company;
  UserOperations(this.company);
  @override
  State<UserOperations> createState() => _UserOperationsState(company);
}

class _UserOperationsState extends State<UserOperations> {
  Company company;
  _UserOperationsState(this.company);
  @override
  Widget build(BuildContext context) {
    List stocksList = [
      CompanyStocks(
          name: "User hinzufügen",
          price: 339.1,
          icon: Icons.add,
          dialog: DialogAddUser(company)),
      CompanyStocks(
          name: "User löschen.",
          price: 10.34,
          icon: Icons.delete,
          dialog: DeleteUser()),
      CompanyStocks(
          name: "Rechte zuweisen",
          price: 56.96,
          icon: Icons.admin_panel_settings,
          dialog: AdminRights()),
    ];

    return Container(
        height: 500,
        child: Column(children: [
          Divider(height: 20),
          Container(
              height: 400,
              child: ListView.builder(
                  itemCount: stocksList.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        onTap: () {
                          // Call this in a function
                          showDialog<Dialog>(
                              context: context,
                              builder: (BuildContext context) =>
                                  stocksList[index].dialog);
                        },
                        title: Text(
                          stocksList[index].name,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        leading: Icon(
                          stocksList[index].icon,
                        ),
                        //trailing: Text("\$ ${stocksList[index].price}"),
                      ),
                    ));
                  })),
          Divider(height: 20),
        ]));
  }
}
