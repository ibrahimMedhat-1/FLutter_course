import 'package:flutter/cupertino.dart';

class ArcivedTask extends StatelessWidget {
  const ArcivedTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Arcived Task',
      style: TextStyle(fontSize: 40),
    ));
  }
}
