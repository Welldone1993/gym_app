import 'package:flutter/material.dart';

import 'gym_app.dart';
import 'src/infrastructures/app_controller/app_controller.dart';

void main() async{


  AppController().fullBaseUrl = 'http://localhost:5000/api/v1' ;

   runApp(const GymApp());
}
