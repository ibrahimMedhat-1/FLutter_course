import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../archived_task/archived_task.dart';
import '../../done_task/done_task.dart';
import '../new_task.dart';

part 'new__task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit() : super(NewTaskInitial());
  static NewTaskCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> modules = const [
    NewTask(),
    DoneTask(),
    ArcivedTask(),
  ];
  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeAppScreenBottomNav());
  }

  Database? db;
  List<Map<String, dynamic>> tasks = [];

  createDataBase() async {
    db = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) async {
        await db
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT,time TEXT,status TEXT)')
            .then((value) {
          emit(CreateDataBaseState());
          debugPrint('db created');
        }).catchError((e) {
          debugPrint('err${e.toString()}');
        });
        debugPrint('database created');
      },
      onOpen: (db) {
        getData(db);
        emit(OpenDataBaseState());
        debugPrint('database opened');
      },
    );
  }

  bool isBottomSheetShown = false;
  IconData floatingIcon = Icons.edit;
  Future insertDataBase({
    required var title,
    required var date,
    required var time,
    required var status,
  }) async {
    await db!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","$status")')
          .then((value) {
        floatingIcon = Icons.edit;
        isBottomSheetShown = false;
        emit(InsertDataBaseState());
        debugPrint('success');
        getData(db);
      }).catchError((onError) {
        debugPrint(onError.toString());
      });
    });
  }

  Future getData(db) async {
    tasks = await db!.rawQuery('SELECT * FROM tasks');
    debugPrint(tasks.toString());
    emit(GetDataFromDataBaseState());
  }

  void isShownBottomSheet({
    required isBottomSheetShown,
    required IconData icon,
  }) {
    floatingIcon = icon;
    this.isBottomSheetShown = isBottomSheetShown;
    emit(IsShownBottomSheet());
  }
}
