import 'package:flutter/cupertino.dart';

class DoneTask extends StatelessWidget {
  const DoneTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Done Task',
      style: TextStyle(fontSize: 40),
    ));
  }
}
