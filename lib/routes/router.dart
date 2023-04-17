import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/screens/doctor_detail.dart';
import 'package:doctor_appointment_app/screens/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => Home(),
  '/detail': (context) => SliverDoctorDetail(),
};
