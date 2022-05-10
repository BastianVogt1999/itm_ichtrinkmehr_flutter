import 'package:flutter/material.dart';
import 'package:itm_ichtrinkmehr_flutter/actions_admin/UserManagement/switch_user_management.dart';
import 'package:itm_ichtrinkmehr_flutter/values/company.dart';

class UserManagement extends StatefulWidget {
  UserManagement(this.company);
  Company company;

  @override
  State<UserManagement> createState() => _UserManagementState(company);
}

class _UserManagementState extends State<UserManagement> {
  _UserManagementState(this.company);
  Company company;
  @override
  Widget build(BuildContext context) {
    return Container(child: SwitchUserManagement(company));
  }
}
