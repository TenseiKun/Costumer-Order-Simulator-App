import 'package:fcsfs_order_process_plattechfinals/styling/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';

Scaffold scaffold1({
  required Widget body,
}) {
  return Scaffold(
    backgroundColor: Colors.grey[300],
    appBar: GradientAppBar(
      gradient: LinearGradient(
        colors: [Colors.yellow, Colors.lime],
      ),
      title: textCenter(
        'FCFS Simulation',
        style: appTitle,
      ),
    ),
    body: Padding(padding: const EdgeInsets.all(10), child: body),
  );
}
