import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AiTasksModel {
  Icon icon;
  String name;
  String name1;

  AiTasksModel({this.icon, this.name,this.name1});
}

final List<AiTasksModel> aiTasks = [

  AiTasksModel(
      icon:
      Icon(FontAwesomeIcons.cogs, size: 30.0, color: Colors.blueGrey),
      name: 'Advanced_Object_Detection',
      name1: ' Object\nDetection'),
  AiTasksModel(
      icon: Icon(FontAwesomeIcons.objectUngroup, size: 30.0, color:Colors.greenAccent.shade200),
      name: 'Object_Detection',
      name1: ' Object\nDetection'),

  AiTasksModel(
      icon:
          Icon(FontAwesomeIcons.americanSignLanguageInterpreting, size: 30.0, color: Color(0xFFecbcb4)),
      name: 'Hand_Gesture_Recognition',
      name1: ' Object\nDetection'),
  AiTasksModel(
      icon: Icon(
          FontAwesomeIcons.hippo, size: 30.0, color: Colors.lightBlueAccent.shade200),
      name: 'Animal_Classification_Tensorflow',
      name1: ' Object\nDetection'),

];
