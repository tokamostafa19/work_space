import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/widgets/custom_text_button.dart';

import '../core/fireservices.dart';
import '../core/taskModel.dart';
class Taskform extends StatefulWidget {
  final TaskDataModel? task;

  const Taskform({
    super.key,
    this.task,
  });

  @override
  State<Taskform> createState() => _TaskformState();
}

class _TaskformState extends State<Taskform> {
  final _titleController = TextEditingController();
  final _descriptionController=TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final FirebaseServices firebaseServices = FirebaseServices();
  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description;
      _selectedDate = widget.task!.dateTime;
    }
  }
  void _handleDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
    print('Selected Date: $newDate');
  }
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          child: Column(
            spacing: 10,
        children: [
          SizedBox(height: 10),
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'Task Title',
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            controller: _descriptionController,
            maxLines: 10,
            decoration: const InputDecoration(
              hintText: 'Description',
              border: OutlineInputBorder(),
            ),
          ),
          CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime.now(),
          lastDate:DateTime(2030), onDateChanged: _handleDateChanged),
          CustomTextButton(onPressed: ()async {
            if (_titleController.text.trim().isEmpty) {
              return;
            }

            final task = TaskDataModel(
              id: widget.task?.id,
              title: _titleController.text.trim(),
              description: _descriptionController.text.trim(),
              dateTime: _selectedDate,
              isDone: widget.task?.isDone ?? false,
            );

            if (widget.task == null) {
              await firebaseServices.createTask(task);
            } else {
              await firebaseServices.updateTask(task);
            }

            if (context.mounted) {
              Navigator.pop(context);
            }
          },

            btnTitle: widget.task == null
                ? 'Create Task'
                : 'Update Task',
          ),
        ],
      )),
    );
  }
}

