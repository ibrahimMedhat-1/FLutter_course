import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_futter_course/modules/new_task/bloc_cubit/new__task_cubit.dart';

import '../../shared/components/components.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewTaskCubit, NewTaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = NewTaskCubit.get(context);
        return ListView.separated(
          itemBuilder: (context, index) => taskItem(
            date: NewTaskCubit.get(context).tasks[index]['date'],
            time: NewTaskCubit.get(context).tasks[index]['time'],
            title: NewTaskCubit.get(context).tasks[index]['title'],
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            color: Colors.grey,
          ),
          itemCount: NewTaskCubit.get(context).tasks.length,
        );
      },
    );
  }
}
