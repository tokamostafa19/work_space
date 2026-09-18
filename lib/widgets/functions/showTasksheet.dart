import 'package:flutter/material.dart';
import 'package:workspace/screens/taskform.dart';

Future<void> showTaskForm(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    builder: (context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: CloseButton(),
            ),
             Taskform(),
          ],
        ),
      ),
    ),
  );
}