import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:udemy_futter_course/modules/new_task/bloc_cubit/new__task_cubit.dart';
import 'package:udemy_futter_course/shared/components/components.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleCont = TextEditingController();
  TextEditingController timeCont = TextEditingController();
  TextEditingController dateCont = TextEditingController();
  TextEditingController statusCont = TextEditingController();

  HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewTaskCubit()..createDataBase(),
      child: BlocConsumer<NewTaskCubit, NewTaskState>(
        listener: (context, state) {
          if (state is InsertDataBaseState) {
            titleCont.text = '';
            timeCont.text = '';
            dateCont.text = '';
            statusCont.text = '';
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          NewTaskCubit cubit = BlocProvider.of(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: const Text(
                'Todo',
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'New Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive),
                  label: 'Archie Tasks',
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(cubit.floatingIcon),
              onPressed: () async {
                try {
                  if (cubit.isBottomSheetShown) {
                    // print('hhh');
                    if (formKey.currentState!.validate()) {
                      debugPrint("${formKey.currentState!.validate()}");
                      await cubit
                          .insertDataBase(
                        time: timeCont.text,
                        date: dateCont.text,
                        status: statusCont.text,
                        title: titleCont.text,
                      )
                          .then((value) {
                        debugPrint('success hhh');
                      }).catchError((e) {
                        debugPrint('${e}here');
                      });
                    }
                  } else {
                    cubit.isShownBottomSheet(
                      isBottomSheetShown: true,
                      icon: Icons.add,
                    );
                    scaffoldKey.currentState!
                        .showBottomSheet(
                            (context) => Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //title text field
                                          defaultTextField(
                                            controller: titleCont,
                                            textInputType: TextInputType.text,
                                            text: 'Title',
                                            validate: (stringValue) {
                                              if (stringValue.isEmpty) {
                                                return 'Title must not be empty';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          //time text field
                                          defaultTextField(
                                            onTap: () {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then((value) {
                                                timeCont.text =
                                                    value!.format(context).toString();
                                              });
                                            },
                                            controller: timeCont,
                                            textInputType: TextInputType.text,
                                            text: 'Time',
                                            validate: (stringValue) {
                                              if (stringValue.isEmpty) {
                                                return 'time must not be empty';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          //date text field
                                          defaultTextField(
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime.utc(2023, 12, 31),
                                              ).then((value) {
                                                dateCont.text = DateFormat.yMMMd()
                                                    .format(value!)
                                                    .toString();
                                              });
                                            },
                                            controller: dateCont,
                                            textInputType: TextInputType.text,
                                            text: 'Date',
                                            validate: (stringValue) {
                                              if (stringValue.isEmpty) {
                                                return 'Date must not be empty';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          //status text field
                                          defaultTextField(
                                            controller: statusCont,
                                            textInputType: TextInputType.text,
                                            text: 'Status',
                                            validate: (stringValue) {
                                              if (stringValue.isEmpty) {
                                                return 'Status must not be empty';
                                              }
                                              return null;
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            elevation: 20)
                        .closed
                        .then((value) {
                      cubit.isShownBottomSheet(
                        isBottomSheetShown: false,
                        icon: Icons.edit,
                      );
                      titleCont.text = '';
                      timeCont.text = '';
                      dateCont.text = '';
                      statusCont.text = '';
                    });
                  }
                } catch (error) {
                  debugPrint('$error');
                }
              },
            ),
            body: cubit.tasks.length < 0
                ? const Center(child: CircularProgressIndicator())
                : cubit.modules[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
