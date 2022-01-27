import 'package:acta/screens/add_list/components/list_state.dart';
import 'package:acta/servicies/api/api.dart';
import 'package:acta/servicies/user/api_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

Future<void> editListAndPop(BuildContext context, String listId) async {
  final user = Provider.of<ApiState>(context, listen: false);
  final list = Provider.of<ListState>(context, listen: false);
  if (list.name.text.isEmpty) {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: const Text('Specify a list name'),
        actions: [
          PlatformDialogAction(
            child: const Text('Close'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  } else {
    Navigator.pop(context);
    user.updateUser(await editList(listId, list.createList()));
  }
}
