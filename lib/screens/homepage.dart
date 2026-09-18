import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/styles/colormanager.dart';
import 'package:workspace/widgets/custom_app_bar.dart';
import 'package:workspace/widgets/functions/showTasksheet.dart';

import '../core/taskModel.dart';
import '../widgets/TaskItem.dart';
import 'managment/home_cubit.dart';
import 'managment/homestate.dart';

class Homepage extends StatefulWidget {
  final int index = 0;
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isChecked = false;
  int _index = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    context.read<HomeCubit>().getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 90),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {

                  if (state is LoadingTasksState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is FailedGettingTasksState) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  }

                  if (state is SuccessGettingTasksState) {
                    return StreamBuilder<List<TaskDataModel>>(
                      stream: state.tasks,

                      builder: (context, snapshot) {

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Error: ${snapshot.error}',
                            ),
                          );
                        }

                        final tasks = snapshot.data ?? [];

                        if (tasks.isEmpty) {
                          return const Center(
                            child: Text(
                              'No tasks yet',
                            ),
                          );
                        }

                        return ListView.separated(
                          itemCount: tasks.length,

                          itemBuilder: (context, index) {
                            return TaskItem(
                              task: tasks[index],
                            );
                          },

                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.primarycolor,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        elevation: 4,
        mini: false,
        child: Icon(Icons.add,size: 28,),
        onPressed: () async {
          await showTaskForm(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: Colors.white,
        notchMargin: 8,
        elevation: 10,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.primarycolor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              _index = index;
              _pageController.animateToPage(
                _index,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.note_add), label: ''),
          ],
        ),
      ),
    );
  }
}