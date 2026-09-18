import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/core/taskModel.dart';
import 'package:workspace/styles/colormanager.dart';

import '../screens/managment/home_cubit.dart';
import '../screens/taskform.dart';

class TaskItem extends StatefulWidget {
  final TaskDataModel task;

  const TaskItem({
    super.key,
    required this.task,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 32,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.primarycolor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: widget.task.isDone,
                      onChanged: (value) {
                        setState(() {
                          widget.task.isDone = value ?? false;
                        });
                      },
                    ),

                     SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        widget.task.title,
                        style:  TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        context.read<HomeCubit>().deleteTask(
                          widget.task.id!,
                        );
                      },
                      icon:  Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Padding(
                              padding:  EdgeInsets.all(20),
                              child: Taskform(
                                task: widget.task,
                              ),
                            );
                          },
                        );
                      },
                      icon:  Icon(
                        Icons.edit,
                      ),
                    )
                  ],
                ),

                Divider(
                  indent: 40,
                  endIndent: 40,
                  color: Colors.grey,
                ),

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.task.description,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    Text(
                      '${widget.task.dateTime.day}/'
                          '${widget.task.dateTime.month}/'
                          '${widget.task.dateTime.year}',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}