import 'package:flutter/material.dart';

import 'package:flaiter/models/flaiter_tasks.dart';

class AiTasks extends StatelessWidget {
  final Icon icon;
  final String name;

  final List<AiTasksModel> aiTasks;
  AiTasks({this.icon, this.name, this.aiTasks});

  @override
  Widget build(BuildContext context) {
    String namee=name.replaceAll(RegExp('_'), '\n');
    return InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () => Navigator.pushNamed(context, '/${name.toLowerCase()}'),

        child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,

              SizedBox(height: 12.0),
              Text(namee,
                  style: TextStyle(fontSize: 13.2, fontWeight: FontWeight.w600,color: Colors.white))
            ]));
  }
}
