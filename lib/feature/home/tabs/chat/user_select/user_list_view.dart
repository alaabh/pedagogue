import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/tabs/chat/user_select/user_widget.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../../../model/user.dart';

class UserListView extends StatelessWidget {
  final Function(User) callback;
  final List<User> userList;

  const UserListView({
    super.key,
    required this.callback,
    required this.userList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.addNew(intl.conversation))),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: userList.length,
        itemBuilder: (context, index) => UserWidget(
          user: userList[index],
          callback: callback,
        ),
      ),
    );
  }
}
